package com.axsos.log_reg.services;

import com.axsos.log_reg.models.LoginPeople;
import com.axsos.log_reg.models.People;
import com.axsos.log_reg.repositories.PeopleRepository;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import java.util.Optional;

@Service
public class PeopleService {
    private final PeopleRepository peopleRepository;

    public PeopleService(PeopleRepository peopleRepository) {
        this.peopleRepository = peopleRepository;
    }

    public People register(People newPeople, BindingResult bindingResult) {
        Optional<People> potentialPeople = peopleRepository.findByEmail(newPeople.getEmail());
        if (potentialPeople.isPresent()) {
            bindingResult.rejectValue("email", "email.exists", "Email already in use!");
        }

        if (!newPeople.getPassword().equals(newPeople.getConfirm())) {
            bindingResult.rejectValue("confirm", "Matches", "The Confirm Password must match Password!");
        }

        if (bindingResult.hasErrors()) {
            return null;
        }

        String hashedPassword = BCrypt.hashpw(newPeople.getPassword(), BCrypt.gensalt());
        newPeople.setPassword(hashedPassword);
        return peopleRepository.save(newPeople);
    }

    public People login(LoginPeople newLoginObject, BindingResult bindingResult) {
        Optional<People> potentialPeople = peopleRepository.findByEmailWithTeams(newLoginObject.getEmail());
        if (potentialPeople.isEmpty()) {
            bindingResult.rejectValue("email", "NotFound", "Email not found!");
            return null;
        }

        People people = potentialPeople.get();

        if (!BCrypt.checkpw(newLoginObject.getPassword(), people.getPassword())) {
            bindingResult.rejectValue("password", "Invalid", "Invalid Password!");
        }

        if (bindingResult.hasErrors()) {
            return null;
        }

        return people;
    }

    public People findById(Long id) {
        return peopleRepository.findById(id).orElse(null);
    }
}
