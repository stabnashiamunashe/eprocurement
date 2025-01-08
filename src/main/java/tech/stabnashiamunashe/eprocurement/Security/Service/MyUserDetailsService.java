package tech.stabnashiamunashe.eprocurement.Security.Service;

import tech.stabnashiamunashe.eprocurement.Security.Models.SecurityUser;
import tech.stabnashiamunashe.eprocurement.Security.Repositories.UserRepository;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class MyUserDetailsService implements UserDetailsService {

    private final UserRepository userRepository;

    public MyUserDetailsService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {

        return userRepository
                .findByEmail(email)
                .map(SecurityUser::new)
                .orElseThrow(()-> new UsernameNotFoundException("Username " + email + " not found!"));
    }
}
