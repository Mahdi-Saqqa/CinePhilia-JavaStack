package com.ner3k.cinephilia.repositories;

import com.ner3k.cinephilia.models.Movie;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MovieRepository extends CrudRepository<Movie,Long> {
}
