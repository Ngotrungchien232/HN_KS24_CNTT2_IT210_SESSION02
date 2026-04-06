package org.example.session02.ex05.controller;



import org.example.session02.ex05.model.User;
import org.example.session02.ex05.service.AuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

/**
 * AuthController (Ex05)
 *
 * URL: /ex05/login (GET/POST)
 *      /ex05/logout (GET)
 */
@Controller
@RequestMapping("/ex05")
public class AuthController {

    @Autowired
    private AuthService authService;

    @GetMapping("/login")
    public String loginPage() {
        return "ex05/login";
    }

    @PostMapping("/login")
    public String login(
            @RequestParam("username") String username,
            @RequestParam("password") String password,
            Model model,
            HttpSession session) {

        // Goi AuthService de kiem tra dang nhap
        User user = authService.authenticate(username, password);

        if (user != null) {
            // Dang nhap thanh cong -> luu vao Session
            session.setAttribute("loggedUser", user);
            session.setAttribute("role", user.getRole());
            return "redirect:/session02/ex05/employees";
        } else {
            // Dang nhap that bai -> luu vao Request
            model.addAttribute("errorMessage", "Ten dang nhap hoac mat khau sai!");
            return "ex05/login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/session02/ex05/login";
    }
}