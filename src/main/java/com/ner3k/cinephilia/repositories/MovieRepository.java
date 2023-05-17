package com.ner3k.cinephilia.repositories;

import com.ner3k.cinephilia.models.Movie;
import java.util.List;
import java.util.Optional;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MovieRepository extends CrudRepository<Movie, Long> {
     List<Movie> findAll();
     Optional <Movie> findById(Long id);
}
