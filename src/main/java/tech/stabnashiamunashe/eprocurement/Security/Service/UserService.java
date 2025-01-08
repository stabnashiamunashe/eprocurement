package tech.stabnashiamunashe.eprocurement.Security.Service;

import org.springframework.context.ApplicationEventPublisher;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import tech.stabnashiamunashe.eprocurement.Security.Models.Role;
import tech.stabnashiamunashe.eprocurement.Security.Models.UserStatus;
import tech.stabnashiamunashe.eprocurement.Security.Models.Users;
import tech.stabnashiamunashe.eprocurement.Security.Repositories.UserRepository;
import org.springframework.stereotype.Service;


import java.util.ArrayList;
import java.util.Optional;

@Service
public class UserService {
    private final PasswordEncoder passwordEncoder;

    private final UserRepository userRepository;


    public UserService(PasswordEncoder passwordEncoder, UserRepository userRepository) {
        this.passwordEncoder = passwordEncoder;
        this.userRepository = userRepository;
    }

    public ResponseEntity<String> saveUser(Users user) {
        if(userRepository.existsByEmail(user.getEmail())){
            return ResponseEntity.status(409).body("User with email or username already exists!");
        }

        user.setAccountLocked(false);
        user.setFailedLoginAttempts(0);
        user.setUserStatus(UserStatus.ACTIVE);


        if(user.getRoles() != null){
            user.getRoles().clear();
            Role newRole = Role.VENDOR;
            user.getRoles().add(newRole);
        }
        else {
            Role newRole = Role.VENDOR;
            user.setRoles(new ArrayList<>());
            user.getRoles().add(newRole);
        }

        Users savedUser = userRepository.save(user);
        return ResponseEntity.ok("User saved!");
    }


    public Users findUserByEmail(String email) {
        return userRepository.findByEmail(email).orElse(null);
    }

    public void incrementFailedLoginAttempts(String email) {
        Optional<Users> optionalUser = userRepository.findByEmail(email);
        if (optionalUser.isPresent()) {
            Users user = optionalUser.get();
            int failedLoginAttempts = user.getFailedLoginAttempts() + 1;
            user.setFailedLoginAttempts(failedLoginAttempts);
            if (failedLoginAttempts >= 20) {
                user.setAccountLocked(true);
            }
            userRepository.save(user);
        }
    }

    public void resetFailedLoginAttempts(String email) {
        Optional<Users> optionalUser = userRepository.findByEmail(email);
        if (optionalUser.isPresent()) {
            Users user = optionalUser.get();
            user.setFailedLoginAttempts(0);
            userRepository.save(user);
        }
    }

    public boolean isAccountLocked(String email) {
        Optional<Users> user = userRepository.findByEmail(email);
        return user.isPresent() && user.get().isAccountLocked();
    }

    public Users registerUser(Users user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        return userRepository.save(user);
    }
}
