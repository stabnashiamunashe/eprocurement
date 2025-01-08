package tech.stabnashiamunashe.eprocurement.Security.Configs;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.domain.AuditorAware;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
import tech.stabnashiamunashe.eprocurement.Security.Service.UserService;

@Configuration
@EnableJpaAuditing(auditorAwareRef = "auditorProvider")
public class AuditConfig {

    private final UserService userService;

    public AuditConfig(UserService userService) {
        this.userService = userService;
    }

    @Bean
    public AuditorAware<Long> auditorProvider() {
        return new AuditorAwareImpl(userService);
    }

}
