package tech.stabnashiamunashe.eprocurement.Security.Configs;

import org.springframework.data.domain.AuditorAware;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.jwt.Jwt;
import tech.stabnashiamunashe.eprocurement.Security.Models.Users;
import tech.stabnashiamunashe.eprocurement.Security.Service.UserService;

import java.util.Optional;

public class AuditorAwareImpl implements AuditorAware<Long> {

    private final UserService userService;

    public AuditorAwareImpl(UserService userService) {
        this.userService = userService;
    }

    public Optional<Long> getCurrentAuditor() {
        return Optional.ofNullable(SecurityContextHolder.getContext())
                .map(SecurityContext::getAuthentication)
                .filter(Authentication::isAuthenticated)
                .map(Authentication::getPrincipal)
                .flatMap(principal -> {
                    if (principal instanceof Jwt) {
                        Jwt jwt = (Jwt) principal;
                        String email = jwt.getSubject();
                        Users user = userService.findUserByEmail(email);
                        return Optional.ofNullable(user).map(Users::getId);
                    } else if (principal instanceof String) {
                        String email = (String) principal;
                        Users user = userService.findUserByEmail(email);
                        return Optional.ofNullable(user).map(Users::getId);
                    } else {
                        return Optional.empty();
                    }
                });
        }

}

