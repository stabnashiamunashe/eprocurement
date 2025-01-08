package tech.stabnashiamunashe.eprocurement.Security.Models;

import lombok.Builder;
import lombok.Data;

import java.util.List;

@Builder
@Data
public class LoginResponse {

    private String token;
    private List<Role> role;
    private String message;
    private boolean success;
}