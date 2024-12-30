package com.axsos.log_reg.repositories;

import com.axsos.log_reg.models.People;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface PeopleRepository extends CrudRepository<People, Long> {
    Optional<People> findByEmail(String email);

    @Query("SELECT p FROM People p LEFT JOIN FETCH p.createdTeams WHERE p.email = :email")
    Optional<People> findByEmailWithTeams(@Param("email") String email);
}
