package com.axsos.log_reg.repositories;

import com.axsos.log_reg.models.People;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface PeopleRepository extends CrudRepository<People, Long> {
    Optional<People> findByEmail(String email);
}