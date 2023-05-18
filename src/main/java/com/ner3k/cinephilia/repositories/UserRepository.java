package com.ner3k.cinephilia.repositories;

import com.ner3k.cinephilia.models.User;
import java.util.Optional;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {
    User findByUsername(String username);
    Optional<User> findUserByEmail(String email);
    boolean existsByEmail(String email);
 }