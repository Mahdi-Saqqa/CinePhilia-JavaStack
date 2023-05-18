package com.ner3k.cinephilia.models;


import jakarta.persistence.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "movies")
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Movie {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Long tmdbId;

    private String title;

    private String language;

    private boolean isAdult;

    private String overview;

    private String actors;

    private String director;

    private String poster;

    private String trailer;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate releaseDate;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
            name = "movies_genres",
            joinColumns = @JoinColumn(name = "movie_id"),
            inverseJoinColumns = @JoinColumn(name = "genre_id")
    )
    private List<Genre> genres = new ArrayList<>();


    @OneToMany(mappedBy="movie", fetch=FetchType.LAZY)
    private List<Rate> rates;



    @OneToMany(mappedBy="movie", fetch=FetchType.LAZY)
    private List<Review> reviews;


    public Double avgRates(){
        List<Rate> allrates= this.rates;
        int counter=0;
        int sum=0;
        for(Rate rate :allrates){
                sum += rate.getRate();
                counter++;
        }
        if(counter == 0){
            return 0.0;
        }
        Double avg= (double) (sum / counter);
        return avg;
    }



}
