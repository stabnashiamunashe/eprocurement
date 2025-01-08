package tech.stabnashiamunashe.eprocurement.Controllers;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.csrf.CsrfToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import tech.stabnashiamunashe.eprocurement.Security.Service.UserService;

import java.util.List;


@Controller
@RequiredArgsConstructor
public class LoginController {

    private final UserService userService;

    @GetMapping("/login")
    public String login(HttpServletRequest request, Model model, String error, String logout) {

        if (error != null) {
            System.out.println(error);
            model.addAttribute("error", true);
            model.addAttribute("errorMessage", "Invalid username or password");
        }

        if (logout != null) {
            model.addAttribute("logout", true);
        }




        System.out.println("Login");
        return "pages/login";
    }



    @GetMapping("/signup")
    public String signUp(HttpServletRequest request, Model model, String error, String logout) {

        if (error != null) {
            System.out.println(error);
            model.addAttribute("error", true);
            model.addAttribute("errorMessage", "Unable to signup");
        }

        if (logout != null) {
            model.addAttribute("logout", true);
        }


        return "pages/vendors/signup";
    }

    @GetMapping("/cards")
    public String vendorTendersX(Model model) {
        System.out.println("Tenders");
        return "pages/cards";
    }

    @GetMapping("/pages/projects")
    public String projects(Model model) {

        model.addAttribute("projects", List.of("Project 1", "Project 2", "Project 3"));

        return "pages/projects";
    }

    @GetMapping("/pages/vendors/projects")
    public String vendorProjects(Model model) {

        model.addAttribute("projects", List.of("Project 1", "Project 2", "Project 3"));

        return "pages/vendors/bidform";
    }

    @GetMapping("/government/home")
    public String governmentHome(Authentication authentication, HttpServletRequest request, Model model ) {

        CsrfToken csrf = (CsrfToken) request.getAttribute(CsrfToken.class.getName());
        if (csrf != null) {
            System.out.println(csrf.getToken());
            model.addAttribute("csrf", csrf);
        }

        model.addAttribute("email", authentication.getName());

        return "pages/government/home";
    }



    @GetMapping("/regulatory/home")
    public String regulatoryHome(Model model) {
        return "pages/regulatory/home";
    }

    @GetMapping("/vendor/home")
    public String vendorHome(Model model) {
        return "pages/vendor/home";
    }



//    @PostMapping("/dashboard")
//    public String home(LoginRequest loginRequest, Model model) {
//
//        LoginResponse loginResponse = authService.login(loginRequest.getEmail(), loginRequest.getPassword());
//        System.out.println(loginResponse.isSuccess());
//        System.out.println(loginResponse.getMessage());
//
//        CsrfToken csrf = (CsrfToken) request.getAttribute(CsrfToken.class.getName());
//        if (csrf != null) {
//            model.addAttribute("csrf", csrf);
//        }
//
//        if (!loginResponse.isSuccess() ) {
//            System.out.println(loginResponse.getMessage());
//            System.out.println();
//            model.addAttribute("error", true);
//            model.addAttribute("errorMessage", "Invalid username or password");
//
//            return "pages/login";
//        } else{
//
//            List<Role> roles = loginResponse.getRole();
//
////            switch ( roles.get(0).name()) {
////                case "VENDOR" :
////                    redirectUrl = "/pages/adminDashboard";
////                    break;
////                case "VENDOR":
////                    redirectUrl = "/pages/vendorDashboard";
////                    break;
////                case "DEPARTMENT_USER":
////                    redirectUrl = "/pages/departmentDashboard";
////                    break;
////                default:
////                    redirectUrl = "/pages/userDashboard";
////                    break;
////            }
//
//            return "redirect:/government/home";
//        }
//
//
//    }
}
