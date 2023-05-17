package com.ner3k.cinephilia.controllers;



import com.ner3k.cinephilia.models.User;
import com.ner3k.cinephilia.services.MovieService;
import com.ner3k.cinephilia.services.UserService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import java.security.Principal;
import org.apache.tomcat.util.json.JSONParser;
import org.apache.tomcat.util.json.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private MovieService movieService;

    @RequestMapping("/register")
    public String registerForm(@ModelAttribute("user") User user) {
        return "register.jsp";
    }

    @RequestMapping("/login")
    public String login(@RequestParam(value="error", required=false) String error, @RequestParam(value="logout", required=false) String logout, Model model) {
        if(error != null) {
            model.addAttribute("errorMessage", "Invalid Credentials, Please try again.");
        }
        if(logout != null) {
            model.addAttribute("logoutMessage", "Logout Successful!");
        }
        return "login.jsp";
    }



    @PostMapping("/register")
    public String registration(@Valid @ModelAttribute("user") User user, BindingResult result, Model model, HttpSession session) {
        if (result.hasErrors()) {
            return "register.jsp";
        }
        userService.saveWithUserRole(user);
        return "redirect:/login";
    }
    @RequestMapping(value = {"/", "/home","/main"})
    public String home(Principal principal, Model model) {
        // 1
        String username = principal.getName();
        model.addAttribute("currentUser", userService.findByUsername(username));
        return "index.jsp";
    }
    @GetMapping("/admin/newmovie")
    public String addMovie(){

        return "addMovie.jsp";
    }
    @PostMapping("/admin/newmovie")
    public String addMovieAction(@RequestParam("movieId") String movieId , Model model, HttpSession session) throws ParseException, ParseException {
        model.addAttribute("movieId", movieId);
        model.addAttribute("movie",movieService.addMovie(movieId));

        return "movie.jsp";
    }

}