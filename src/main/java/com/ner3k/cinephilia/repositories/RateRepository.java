package com.ner3k.cinephilia.repositories;


import com.ner3k.cinephilia.models.Rate;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RateRepository extends CrudRepository<Rate, Long> {

}
