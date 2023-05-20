package com.ner3k.cinephilia.services;


import com.ner3k.cinephilia.models.Movie;
import com.ner3k.cinephilia.repositories.MovieRepository;
import java.util.List;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@AllArgsConstructor
@Service
public class MovieApiServices {
    private final MovieRepository movieRepository;

    public List<Movie> getAllMovies() {
        List<Movie> movies= movieRepository.findAll();
        return filterMovies(movies);
    }

    private List<Movie> filterMovies(List<Movie> movies) {
        for(Movie movie : movies){
            movie.setTmdbId(null);
            movie.setLanguage(null);
            movie.setOverview(null);
            movie.setActors(null);
            movie.setReleaseDate(null);
            movie.setDirector(null);
            movie.setGenres(null);
            movie.setRates(null);
            movie.setReviews(null);

        }

        return movies;
    }

    public List<Movie> getMovieByTitle(String title) {
        List<Movie> movies = movieRepository.getMoviesByTitleContains(title);
        return filterMovies(movies);
    }





}
