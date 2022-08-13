package hu.oliver.tesztfeladatweblap.Service;

import hu.oliver.tesztfeladatweblap.Model.User;
import hu.oliver.tesztfeladatweblap.Repository.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.Instant;

@Service
@RequiredArgsConstructor
@Slf4j
public class UserService {

    private final UserRepository userRepository;


    public boolean register(User user){
        try{
            User foundUser = userRepository.findUserByUsername(user.getUsername());


            if(foundUser==null){
                BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
                user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
                userRepository.save(user);
                return true;
            }else{
                return false;
            }
        }catch (Exception e){
            log.error("Hiba: "+e);
            return false;
        }



    }

    public User findLoggedInuser(String username){
        return userRepository.findUserByUsername(username);
    }

    public void updateLastLoggedIn(User user){
        Date date = new Date(System.currentTimeMillis());
        user.setLastLoggedIn(new Timestamp(date.getTime()));
        userRepository.save(user);
    }

}
