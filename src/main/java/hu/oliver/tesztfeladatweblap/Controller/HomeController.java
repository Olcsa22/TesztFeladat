package hu.oliver.tesztfeladatweblap.Controller;

import cn.apiclub.captcha.Captcha;
import hu.oliver.tesztfeladatweblap.Model.SpringSessionAttributes;
import hu.oliver.tesztfeladatweblap.Repository.SpringSessionAttributesRepository;
import hu.oliver.tesztfeladatweblap.Service.CaptchaValidator;
import hu.oliver.tesztfeladatweblap.Service.UserService;
import hu.oliver.tesztfeladatweblap.Model.User;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.hibernate.Session;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.www.BasicAuthenticationConverter;
import org.springframework.session.FindByIndexNameSessionRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.nio.charset.StandardCharsets;
import java.security.Principal;
import java.sql.Timestamp;
import java.util.Base64;
import java.util.Collection;
import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
public class HomeController {

    private final CaptchaValidator validator;
    private final UserService userService;
    private final BasicAuthenticationConverter authenticationConverter=new BasicAuthenticationConverter();
    private final AuthenticationManager authenticationManager;

    private final SpringSessionAttributesRepository springSessionAttributesRepository;

    FindByIndexNameSessionRepository<? extends Session> sessions;


    @GetMapping("/loginUser")
    public String login(Principal principal, Model model){
        if(isAuthenticated()){
            updateLoggedIn(principal,model);
            return "home";
        }else {
            return "login";
        }
    }

    @GetMapping("/login-error")
    public String loginError(HttpServletRequest request, Model model) {
        HttpSession httpSession = request.getSession();
        if(httpSession.getAttribute("trynum")==null){
            httpSession.setAttribute("trynum",1);
        }else{
            httpSession.setAttribute("trynum",(int) httpSession.getAttribute("trynum")+1);
            if((int) httpSession.getAttribute("trynum")>=3){

                model.addAttribute("captchaUser", true);
            }
        }
        log.warn("Sikertelen bejelentkezések száma: "+httpSession.getAttribute("trynum"));
        return "login";
    }

    @PostMapping("/captchaLogin")
    public void captchaLogin(@ModelAttribute User captchaUser,
                      @RequestParam("g-recaptcha-response") String captcha, HttpServletRequest req){
        if(validator.isValidCaptcha(captcha) && captchaUser.getPassword()!= null && captchaUser.getUsername()!=null
        && !captchaUser.getUsername().equals("null") && !captchaUser.getPassword().equals("null")){
            UsernamePasswordAuthenticationToken authenticationToken = this.authenticationConverter.convert(req);
            Authentication authResult;
            authResult = this.authenticationManager.authenticate(authenticationToken);

            SecurityContext context = SecurityContextHolder.createEmptyContext();
            context.setAuthentication(authResult);
            SecurityContextHolder.setContext(context);
        }
    }

    @GetMapping("/register")
    public String register(Principal principal,Model model){
        if(isAuthenticated()){
            updateLoggedIn(principal,model);
            //model.addAttribute("loggedInAs",userService.findLoggedInuser(SecurityContextHolder.getContext().getAuthentication().getName()));
            return "home";
        }else {
            model.addAttribute("user", new User());
            return "register";
        }
    }

    @GetMapping("/home")
    public String home(Principal principal,Model model){
        updateLoggedIn(principal,model);
        return "home";
    }

    @GetMapping
    public String indexPage(Principal principal, Model model){
        if(isAuthenticated()){
            return "home";
        }else {
            return "index";
        }
    }

    @PostMapping(value = "/registerUser")
    public String registerUser(@ModelAttribute User user){
       if(userService.register(user)){
           log.info("Sikeres regisztráció: "+user.getUsername());
           return "login";
       }else{
           log.info("Sikertelen regisztráció: "+user.getUsername());
           return "login";
       }
    }

    @GetMapping(value = "/contentcreators")
    @PreAuthorize("hasRole('ROLE_ADMIN') or hasRole('ROLE_TARTALOMSZERKESZTO')")
    public String getContentCreators(){
        return "contentcreator";
    }

    @GetMapping(value = "/admin")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public String getAdmin(){
        return "admin";
    }

    @GetMapping(value = "/loggedin")
    @PreAuthorize("hasRole('ROLE_ADMIN') or hasRole('ROLE_BEJELENTKEZETT_FELHASZNALO')")
    public String getLoggedIn(){
        return "loggedin";
    }


    private boolean isAuthenticated() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null || AnonymousAuthenticationToken.class.
                isAssignableFrom(authentication.getClass())) {
            return false;
        }
        return authentication.isAuthenticated();
    }

    private void updateLoggedIn(Principal principal, Model model){

        User loggedIn = userService.findLoggedInuser(principal.getName());
        Timestamp lastLoggedIn = loggedIn.getLastLoggedIn();
        if(model.getAttribute("lastLoggedIn")==null) {
            model.addAttribute("lastLoggedIn", lastLoggedIn);
            model.addAttribute("loggedInAs", loggedIn);
        }
        userService.updateLastLoggedIn(loggedIn);
    }


}
