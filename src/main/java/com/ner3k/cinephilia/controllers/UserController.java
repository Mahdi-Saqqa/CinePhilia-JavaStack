package com.ner3k.cinephilia.controllers;


import com.ner3k.cinephilia.models.Movie;
import com.ner3k.cinephilia.models.Rate;
import com.ner3k.cinephilia.models.User;
import com.ner3k.cinephilia.services.MovieService;
import com.ner3k.cinephilia.services.UserService;
import com.ner3k.cinephilia.validators.UserValidator;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import java.io.IOException;
import java.security.Principal;
import java.util.Random;
import org.eclipse.tags.shaded.org.apache.xpath.operations.Mod;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.apache.tomcat.util.json.ParseException;
import org.springframework.security.core.Authentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
public class UserController {


    @Autowired
    private UserValidator userValidator;

    @Autowired
    private UserService userService;
    @Autowired
    private MovieService movieService;

    @RequestMapping("/register")
    public String registerForm(@ModelAttribute("user") User user,Model model) {

        Random random = new Random();
        int bg_Id = random.nextInt(4);
        model.addAttribute("bg_Id",bg_Id);
        return "registration.jsp";
    }

    @RequestMapping("/login")
    public String login(@RequestParam(value = "error", required = false) String error, @RequestParam(value = "logout", required = false) String logout, Model model,Principal principal) {
        System.out.println(principal);
        if (principal != null){
            return "redirect:/home";
        }

        if (error != null) {
            model.addAttribute("errorMessage", "Invalid Credentials, Please try again.");
        }
        if (logout != null) {
            model.addAttribute("logoutMessage", "Logout Successful!");
        }
        return "signin.jsp";
    }


    @PostMapping("/register")
    public String registration(@Valid @ModelAttribute("user") User user, BindingResult result, Model model, HttpSession session) {
        userValidator.validate(user, result);

        if (result.hasErrors()) {
            Random random = new Random();
            int bg_Id = random.nextInt(4);
            model.addAttribute("bg_Id",bg_Id);
            return "registration.jsp";
        }
        userService.saveWithUserRole(user);
        return "redirect:/login";
    }

    @RequestMapping(value = {"/", "/home", "/main"})
    public String home(Principal principal, Model model) {
        System.out.println(principal);
        if (principal != null){
            String username = principal.getName();
            User currentUser = userService.findByUsername(username);
            model.addAttribute("currentUser", currentUser);
        }
        model.addAttribute("movies",movieService.getAllMovies());
        return "index.jsp";
    }

    @GetMapping("/admin/newmovie")
    public String addMovie(Principal principal, Model model) {

        System.out.println(principal);
        if (principal != null){
            String username = principal.getName();
            User currentUser = userService.findByUsername(username);
            model.addAttribute("currentUser", currentUser);
        }

        return "addMovie.jsp";
    }

    @PostMapping("/admin/newmovie")
    public String addMovieAction(@RequestParam("movieId") String movieId, Model model, HttpSession session) throws ParseException, ParseException, IOException {
        Movie movie=  movieService.addMovie(movieId);

        return "redirect:/movie/"+movie.getId();
    }

    @GetMapping("/search")
    public String searchMovie(Model model, HttpSession session,Principal principal) throws ParseException, ParseException, IOException {
        model.addAttribute("movies",movieService.getAllMovies());
        System.out.println(principal);
        if (principal != null){
            String username = principal.getName();
            User currentUser = userService.findByUsername(username);
            model.addAttribute("currentUser", currentUser);
        }

        return "search.jsp";
    }


    @GetMapping("/movie/{id}")
    public String view(Model model, HttpSession session,@PathVariable("id")Long id,Principal principal) throws ParseException{
        Movie movie= movieService.getMovie(id);
        if (principal != null){
            String username = principal.getName();
            User currentUser = userService.findByUsername(username);
            boolean rated = false;
            int loggedUserRate=0;
            if(currentUser.getRatedMoviesId().contains(movie.getId())){
                for(Rate r : movie.getRates()) {
                    if(r.getUser().getUsername().equals(currentUser.getUsername())){
                         loggedUserRate= r.getRate();
                    }
                }
            }
            model.addAttribute("loggedUserRate", loggedUserRate);
            model.addAttribute("currentUser", currentUser);
        }
        model.addAttribute("movie",movie);
        return "movie.jsp";
    }

    @GetMapping("/profile")
    public String viewProfile(Principal principal,Model model) {
        System.out.println(principal);
        if (principal != null){
            String username = principal.getName();
            User currentUser = userService.findByUsername(username);
            model.addAttribute("currentUser", currentUser);
        }
        return "profile.jsp";
    }
    @GetMapping("/aboutus")
    public String viewAbout(Principal principal,Model model) {

        System.out.println(principal);
        if (principal != null){
            String username = principal.getName();
            User currentUser = userService.findByUsername(username);
            model.addAttribute("currentUser", currentUser);
        }
        return "about.jsp";
    }

    @GetMapping("/access-denied")
    public String getAccessDenied(Principal principal, Model model) {
        System.out.println(principal);
        if (principal != null){
            String username = principal.getName();
            User currentUser = userService.findByUsername(username);
            model.addAttribute("currentUser", currentUser);
        }
        System.out.println("Access Denied");
        return "denied.jsp";
    }
    @GetMapping("/rateMovie/{movieId}/{rate}")
    public String rateMovie(@PathVariable("movieId") Long movieId, @PathVariable("rate") int rate,Principal principal) throws ParseException, ParseException, IOException {

        if(principal==null){
            return "redirect:/login";
        }
        String username = principal.getName();
        User user = userService.findByUsername(username);
        Movie movie = movieService.getMovie(movieId);

        boolean rated = false;
        if(user.getRatedMoviesId().contains(movie.getId())){
            for(Rate r : movie.getRates()) {
                if(r.getUser().getUsername().equals(user.getUsername())){
                    r.setRate(rate);
                    movieService.updateMovieRate(r);
                    return "redirect:/movie/"+movieId;

                }
            }
        }
        movieService.rateMovie(movie,rate,user);
        return "redirect:/movie/"+movieId;
    }


    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @RequestMapping ("/login/facebook")
    public String loginWithFacebook(Authentication authentication) {
        OAuth2User oauth2User = (OAuth2User) authentication.getPrincipal();
        logger.debug("Login with Facebook endpoint called.");

        // Extract user details from the OAuth2User object
        String name = oauth2User.getAttribute("name");
        String email = oauth2User.getAttribute("email");

        // Save the user in the database
        User user = new User();
        user.setUsername(name);
        user.setEmail(email);
        userService.save(user);
        return "facebook.jsp";
    }

    @GetMapping("/genre/{id}")
    public String viewGenre(@PathVariable("id") Long id, Model model,Principal principal) throws ParseException {
        System.out.println(principal);
        if (principal != null){
            String username = principal.getName();
            User currentUser = userService.findByUsername(username);
            model.addAttribute("currentUser", currentUser);
        }
        model.addAttribute("genre",movieService.getGenreByID(id));
        model.addAttribute("movies",movieService.getMoviesByGenre(id));
        return "genre.jsp";
    }
    @GetMapping("/discover")
    public String discover( Model model,Principal principal) throws ParseException {
        System.out.println(principal);
        if (principal != null) {
            String username = principal.getName();
            User currentUser = userService.findByUsername(username);
            model.addAttribute("currentUser", currentUser);
        }
        model.addAttribute("genre", "Discover");
        model.addAttribute("movies", movieService.getRandomMovies());
        return "genre.jsp";
    }
}