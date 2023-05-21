package com.ner3k.cinephilia.restcontrollers;


import com.ner3k.cinephilia.models.Movie;
import com.ner3k.cinephilia.services.MovieApiServices;
import com.ner3k.cinephilia.services.MovieService;
import java.util.List;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@AllArgsConstructor
@Controller
@RequestMapping("/api/v1/")
public class API {

    private final MovieApiServices movieApiServices;

    @GetMapping("/movies")
    public ResponseEntity<List<Movie>> getMovies() {

        return ResponseEntity.ok(movieApiServices.getAllMovies());
    }
    @GetMapping("/movies/findByTitle/{title}")
    public ResponseEntity<List<Movie>> getMoviesByTitle(@PathVariable String title) {

        return ResponseEntity.ok(movieApiServices.getMovieByTitle(title));
    }



}
