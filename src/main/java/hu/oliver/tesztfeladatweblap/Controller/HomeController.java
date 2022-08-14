package hu.oliver.tesztfeladatweblap.Controller;

import cn.apiclub.captcha.Captcha;
import hu.oliver.tesztfeladatweblap.Model.SpringSessionAttributes;
import hu.oliver.tesztfeladatweblap.Repository.SpringSessionAttributesRepository;
import hu.oliver.tesztfeladatweblap.Security.SecurityConfiguration;
import hu.oliver.tesztfeladatweblap.Service.CaptchaValidator;
import hu.oliver.tesztfeladatweblap.Service.UserService;
import hu.oliver.tesztfeladatweblap.Model.User;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.hibernate.Session;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.www.BasicAuthenticationConverter;
import org.springframework.session.FindByIndexNameSessionRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.thymeleaf.extras.springsecurity5.util.SpringSecurityContextUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.Principal;
import java.sql.Date;
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


    @GetMapping("/login")
    public String login(){
        if(isAuthenticated()){
            return "home";
        }else {
            return "login";
        }
    }


    @PostMapping("/captchaLogin")
    public ResponseEntity captchaLogin(@RequestBody String captcha,
                                       HttpServletRequest request,
                                       HttpServletResponse response) throws IOException {
        if(validator.isValidCaptcha(captcha)){
            UsernamePasswordAuthenticationToken authenticationToken = authenticationConverter.convert(request);
            Authentication authResult;
            authResult = this.authenticationManager.authenticate(authenticationToken);
            SecurityContext context = SecurityContextHolder.createEmptyContext();
            context.setAuthentication(authResult);
            SecurityContextHolder.setContext(context);

            HttpSession httpSession = request.getSession();
            UserDetails userDetails = (UserDetails) context.getAuthentication().getPrincipal();
            String username = userDetails.getUsername();
            User loggedIn = userService.findLoggedInuser(username);

            userService.updateLastLoggedIn(loggedIn,httpSession);
            httpSession.setAttribute("loggedInAs",loggedIn);
            log.info("Sikeres bejelentkezés: "+loggedIn.getUsername());
            return new ResponseEntity(true, HttpStatus.OK);
        }else{
            return new ResponseEntity(false, HttpStatus.BAD_REQUEST);
        }
    }

    @GetMapping("/register")
    public String register(Principal principal,Model model){
        if(isAuthenticated()){
            return "home";
        }else {
            model.addAttribute("user", new User());
            return "register";
        }
    }

    @GetMapping("/home")
    public String home(){
        if(isAuthenticated()) {
            return "home";
        }else{
            return "login";
        }
    }

    @GetMapping
    public String indexPage(){
        if(isAuthenticated()){
            return "home";
        }else {
            return "index";
        }
    }

    @PostMapping(value = "/registerUser")
    public String registerUser(@ModelAttribute User user, Model model){
       if(userService.register(user)){
           log.info("Sikeres regisztráció: "+user.getUsername());
           return "login";
       }else{
           log.info("Sikertelen regisztráció: "+user.getUsername());
           model.addAttribute("registerError","Már létezik ilyen felhasználó");
           return "register";
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


}
