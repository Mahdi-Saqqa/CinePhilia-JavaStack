package com.ner3k.cinephilia.repositories;

import com.ner3k.cinephilia.models.Genre;
import org.springframework.data.repository.CrudRepository;

public interface GenreRepository extends CrudRepository<Genre,Long> {

    boolean existsByName(String name);
    Genre findByName(String name);
}
