package com.ner3k.cinephilia.models;

import jakarta.persistence.*;
import java.util.ArrayList;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "genres")
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Genre {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    //Title
    private Long tmdbGenreId;
    private String name;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
            name = "movies_genres",
            joinColumns = @JoinColumn(name = "genre_id"),
            inverseJoinColumns = @JoinColumn(name = "movie_id")
    )
    private List<Movie> movies = new ArrayList<>();
}
