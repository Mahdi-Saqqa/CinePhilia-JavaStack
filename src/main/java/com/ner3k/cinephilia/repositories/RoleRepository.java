package com.ner3k.cinephilia.repositories;

import com.ner3k.cinephilia.models.Role;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RoleRepository extends CrudRepository<Role, Long> {


}
