package tech.stabnashiamunashe.eprocurement.Security.Models;

import com.fasterxml.jackson.annotation.*;
import jakarta.persistence.*;
import lombok.*;
import java.util.List;

@Entity
@Inheritance(strategy = InheritanceType.JOINED)
@Getter
@Setter
@RequiredArgsConstructor
public class Users extends AuditorEntity{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String email;

    private String address;

    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    private String password;

    @Enumerated(EnumType.STRING)
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    private List<Role> roles;

    private String contactNumber;

    @Enumerated(EnumType.STRING)
    private UserStatus userStatus;

    private int failedLoginAttempts;

    private boolean accountLocked;

}

