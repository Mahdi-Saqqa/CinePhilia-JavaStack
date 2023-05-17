package com.ner3k.cinephilia.services;


import com.ner3k.cinephilia.models.Movie;
import com.ner3k.cinephilia.repositories.MovieRepository;
import java.util.HashMap;
import org.apache.tomcat.util.json.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class MovieService {
    @Autowired
    private MovieRepository movieRepository;

    public static HashMap getMovie(String id) throws ParseException {
        final String uri = "https://api.themoviedb.org/3/movie/" + id + "?api_key=936ec287a61d8548efeb41653e17f492";

        RestTemplate restTemplate = new RestTemplate();
        HashMap<String, String> result = restTemplate.getForObject(uri, HashMap.class);
        return result;
    }

    public Movie addMovie(String id) throws ParseException {

        HashMap result = getMovie(id);
        Movie movie = new Movie();
        movie.setTitle((String) result.get("title"));
        movie.setAdult((boolean) result.get("adult"));
        movie.setOverview((String) result.get("overview"));
        movie.setPoster((String) result.get("poster_path"));
        movie.setLanguage((String) result.get("original_language"));
        return movieRepository.save(movie);
    }
}
