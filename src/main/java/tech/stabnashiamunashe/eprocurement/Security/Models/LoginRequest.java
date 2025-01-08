package tech.stabnashiamunashe.eprocurement.Security.Models;


import lombok.Builder;
import lombok.Data;

@Data
public class LoginRequest {


    private String email;
    private String password;
    private String firstName;

    public LoginRequest() {
    }

}