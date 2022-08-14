package hu.oliver.tesztfeladatweblap.Security;

import hu.oliver.tesztfeladatweblap.Model.User;
import hu.oliver.tesztfeladatweblap.Repository.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;

@Configuration
@RequiredArgsConstructor
@Slf4j
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

   private final UserDetailsServiceImpl userDetailsService;
   private final UserRepository userRepository;

    @Override
    public void configure(AuthenticationManagerBuilder authenticationManagerBuilder) throws Exception {
        authenticationManagerBuilder.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
    }

    @Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }



    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .csrf().disable()
                .authorizeRequests()
                .antMatchers("/register").permitAll()
                .antMatchers("/registerUser").permitAll()
                .antMatchers("/captchaLogin").permitAll()
                .antMatchers("/").permitAll()
                .antMatchers("/js/scripts.js").permitAll()
                .antMatchers("/css/styles.css").permitAll()
                .antMatchers("/resources/**").permitAll()
                .anyRequest().authenticated()
                .and()
                .formLogin()
                    .loginPage("/login")
                    .permitAll()
                    .failureUrl("/login-error")
                    .defaultSuccessUrl("/home", true)
                .successHandler(new AuthenticationSuccessHandler() {

                    @Override
                    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                                        Authentication authentication) throws IOException, ServletException {



                        HttpSession httpSession = request.getSession();
                        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
                        String username = userDetails.getUsername();
                        User loggedIn = userRepository.findUserByUsername(username);
                        Timestamp lastLoggedIn = loggedIn.getLastLoggedIn();

                        if(lastLoggedIn!=null) {
                            httpSession.setAttribute("lastLoggedIn",lastLoggedIn);
                        }

                        Date date = new Date(System.currentTimeMillis());
                        loggedIn.setLastLoggedIn(new Timestamp(date.getTime()));
                        userRepository.save(loggedIn);
                        httpSession.setAttribute("loggedInAs",loggedIn);
                        log.info("Sikeres bejelentkezés: "+loggedIn.getUsername());
                        response.sendRedirect(request.getContextPath());
                    }
                })
                .failureHandler(new AuthenticationFailureHandler() {
                    @Override
                    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
                        HttpSession httpSession = request.getSession();
                        if(httpSession.getAttribute("trynum")==null){
                            httpSession.setAttribute("trynum",1);
                        }else{
                            httpSession.setAttribute("trynum",(int) httpSession.getAttribute("trynum")+1);
                            if((int) httpSession.getAttribute("trynum")>=3){

                                httpSession.setAttribute("captchaUser", true);
                            }
                        }
                        httpSession.setAttribute("loginError","Hibás felhasználónév, vagy jelszó!");
                        log.error("Sikertelen bejelentkezés");
                        log.warn("Sikertelen bejelentkezések száma: "+httpSession.getAttribute("trynum"));
                        response.sendRedirect("/login");
                    }
                })
                .and()
                .logout()
                .logoutUrl("/logout")
                .logoutSuccessUrl("/login");



    }

    @Override
    public void configure(WebSecurity web) throws Exception {
        web
                .ignoring()
                .antMatchers("/resources/**");
    }




}
