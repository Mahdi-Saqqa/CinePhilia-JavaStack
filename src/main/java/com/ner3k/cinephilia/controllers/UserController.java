package com.ner3k.cinephilia.controllers;

import com.ner3k.cinephilia.models.User;
import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {

    @RequestMapping("/register")
    public String registerForm(@ModelAttribute("user") User user) {
        return "register.jsp";
    }

    @RequestMapping("/login")
    public String login() {
        return "login.jsp";
    }
}