package com.ner3k.cinephilia.repositories;

import com.ner3k.cinephilia.models.Genre;
import java.util.List;
import org.springframework.data.repository.CrudRepository;

public interface GenreRepository extends CrudRepository<Genre,Long> {

    boolean existsByName(String name);
    Genre findByName(String name);
    List<Genre> findAll();
    Genre getById(Long id);
}
