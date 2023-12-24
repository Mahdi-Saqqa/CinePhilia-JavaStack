package com.ner3k.cinephilia.controllers;


import com.ner3k.cinephilia.models.*;
import com.ner3k.cinephilia.services.MovieService;
import com.ner3k.cinephilia.services.UserService;
import com.ner3k.cinephilia.validators.UserValidator;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import java.io.IOException;
import java.security.Principal;
import java.util.List;
import java.util.Objects;
import java.util.Random;
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

    @RequestMapping("/test")
    public String test(Model model) {

        return "test.jsp";
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
        if (principal != null) {
            String username = principal.getName();
            User currentUser = userService.findByUsername(username);
            model.addAttribute("currentUser", currentUser);
            if (currentUser.isAdult()) {
                model.addAttribute("movies", movieService.getAllMovies());
                return "index.jsp";

            } else {
                model.addAttribute("movies", movieService.filter(movieService.getAllMovies()));
                return "index.jsp";

            }
        }
        model.addAttribute("movies", movieService.filter(movieService.getAllMovies()));
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
    public String addMovieAction(@RequestParam("movieId") String movieId,@RequestParam("isAdult") boolean isAdult ) throws  ParseException, IOException {
        Movie movie=  movieService.addMovie(movieId,isAdult);
        return "redirect:/movie/"+movie.getId();
    }
    @GetMapping("/search")
    public String searchMovie(Model model, HttpSession session,Principal principal) {
        System.out.println(principal);
        if (principal != null){
            String username = principal.getName();
            User currentUser = userService.findByUsername(username);
            model.addAttribute("currentUser", currentUser);
        }

        return "search.jsp";
    }


    @GetMapping("/movie/{id}")
    public String view(@RequestParam(value = "error", required = false) String error, Model model, HttpSession session,@PathVariable("id")Long id,Principal principal) throws ParseException{
        Movie movie= movieService.getMovie(id);

        if(error!=null){
            model.addAttribute("errorMessage", "review should be at least 8 characters long");
        }
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
            if (currentUser.getWishes().contains(movie)){
                model.addAttribute("wished",true);
            }
            else {
                model.addAttribute("wished",false);
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
        return "editmovie.jsp";
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
        model.addAttribute("genre",movieService.getGenreByID(id));
        List<Movie> allMovie = movieService.getMoviesByGenre(id);

        System.out.println(principal);
        if (principal != null){
            String username = principal.getName();
            User currentUser = userService.findByUsername(username);
            model.addAttribute("currentUser", currentUser);
            if(currentUser.isAdult()) {
                model.addAttribute("movies",allMovie);
                return "genre.jsp";
            }
        }
        model.addAttribute("movies",movieService.filter(allMovie));
        return "genre.jsp";
    }
    @GetMapping("/discover")
    public String discover( Model model,Principal principal) throws ParseException {
        System.out.println(principal);
        List<Movie> allMovie =movieService.getRandomMovies();
        if (principal != null) {
            String username = principal.getName();
            User currentUser = userService.findByUsername(username);
            model.addAttribute("currentUser", currentUser);
            if (currentUser.isAdult()) {
                model.addAttribute("movies",allMovie);
                return "discover.jsp";
            }
        }

        model.addAttribute("movies",movieService.filter(allMovie));
        return "discover.jsp";
    }
    @PostMapping("/movie/{id}/addreview")
    public  String addReview(Principal principal, @PathVariable("id") Long id, @RequestParam(value = "review")String review) throws ParseException{
            if(review.length() <10){
                return "redirect:/movie/"+id+"?error=true";
            }
            String username = principal.getName();
            User currentUser = userService.findByUsername(username);
         Movie movie = movieService.getMovie(id);
       movieService.addReviewToMovie(movie,currentUser,review);
       return "redirect:/movie/"+id;
        }
        @GetMapping("/deletereview/{reviewId}")
    public String deleteReview(@PathVariable("reviewId") Long reviewId, Model model,Principal principal) throws ParseException {
            Review review = movieService.getReviewByID(reviewId);
            String username = principal.getName();
            User currentUser = userService.findByUsername(username);
            System.out.println("review method");
            if (Objects.equals(currentUser.getId(), review.getUser().getId())) {
                System.out.println("review user");
                movieService.deleteReview(review.getId());
            }
            else  {
                for(Role role : currentUser.getRoles()) {
                    if(role.getName().equals("ROLE_ADMIN")) {
                        System.out.println("admin");
                        movieService.deleteReview(review.getId());
                    }
                }
            }

            return "redirect:/movie/"+review.getMovie().getId();
        }

    @PostMapping("/review/{id}/edit")
    public String editReview(Principal principal, @PathVariable("id") Long id, @RequestParam(value = "review")String review) throws ParseException{
        if(review.length() <8){
            return "redirect:/review/"+id+"?error=true";
        }

        String username = principal.getName();
        User currentUser = userService.findByUsername(username);
        Review review1 = movieService.getReviewByID(id);
        if(Objects.equals(currentUser.getId(), review1.getUser().getId())){
            movieService.updateReview(review1,review);
        }
        return "redirect:/movie/"+review1.getMovie().getId();
    }

    @GetMapping("/switchmode")
    public String switchMode(Principal principal) throws ParseException {
        String username = principal.getName();
        System.out.println(username);

        User currentUser = userService.findByUsername(username);
        System.out.println(currentUser.isDark());
        currentUser.setDark(!currentUser.isDark());
        System.out.println(currentUser.isDark());
        userService.update(currentUser);
        return "redirect:/home";
    }

    @GetMapping("/admin/deletemovie/{id}")
    public String adminDeleteMovie(@PathVariable("id") Long id) throws ParseException {
        Movie movie = movieService.getMovieById(id);
        movieService.deleteMovie(movie);
        return "redirect:/home";
    }



    @GetMapping("/admin/editmovie/{id}")
    public String adminEditMovie(@PathVariable("id") Long id,Model model,Principal principal) throws ParseException {
        if (principal != null){
            String username = principal.getName();
            User currentUser = userService.findByUsername(username);
            model.addAttribute("currentUser", currentUser);
        }
        Movie movie = movieService.getMovieById(id);
        model.addAttribute("movie", movie);
        return "editmovie.jsp";
    }
    @PostMapping("/admin/editmovie/{id}")
    public String adminEditMovie(@PathVariable("id") Long id,
                                 Model model,
                                 @RequestParam(value = "title")String title,
                                 @RequestParam(value = "adult")String isadult,
                                 @RequestParam(value = "overview")String overview) throws ParseException {
        Movie movie = movieService.getMovieById(id);
            movie.setTitle(title);
            movie.setOverview(overview);
            movie.setAdult(Objects.equals(isadult, "true"));
            movieService.updateMovie(movie);

        return "redirect:/movie/"+id;
    }
    @GetMapping("/user/watchlater/{id}")
    public String addWatchlater(@PathVariable("id") Long id,Principal principal) throws ParseException {
        String username = principal.getName();
        Movie movie = movieService.getMovie(id);
        User currentUser = userService.findByUsername(username);
        currentUser.getWishes().add(movie);
        userService.update(currentUser);
        return "redirect:/movie/"+id;
    }
    @GetMapping("/user/watchlater/{id}/delete")
    public String deleteWatchLater(@PathVariable("id") Long id,Principal principal) throws ParseException {
        String username = principal.getName();
        Movie movie = movieService.getMovie(id);
        User currentUser = userService.findByUsername(username);
        currentUser.getWishes().remove(movie);
        userService.update(currentUser);
        return "redirect:/movie/"+id;
    }
    @GetMapping("/wishlist")
    public String wishlist(Model model,Principal principal) throws ParseException {
        String username = principal.getName();
        User currentUser = userService.findByUsername(username);
        List<Movie> movies = currentUser.getWishes();
        model.addAttribute("currentUser", currentUser);
        model.addAttribute("movies", movies);
        return "wishlist.jsp";
    }

    }
