package com.axsos.log_reg.services;


import com.axsos.log_reg.repositories.PeopleRepository;
import com.axsos.log_reg.models.*;
import org.mindrot.jbcrypt.*;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import java.util.Optional;

@Service
public class PeopleService {
    private final PeopleRepository PeopleRepository;
    public PeopleService(PeopleRepository PeopleRepository) {
        this.PeopleRepository = PeopleRepository;
    }

    public People register(People newPeople, BindingResult bindingResult) {
        Optional<People> potentialPeople = PeopleRepository.findByEmail(newPeople.getEmail());
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
        return PeopleRepository.save(newPeople);
    }

    public People login(LoginPeople newLoginObject, BindingResult bindingResult) {
        Optional<People> potentialPeople = PeopleRepository.findByEmail(newLoginObject.getEmail());
        if (potentialPeople.isEmpty()) {
            bindingResult.rejectValue("email", "NotFound", "Email not found!");
            return null;
        }

        People People = potentialPeople.get();

        if (!BCrypt.checkpw(newLoginObject.getPassword(), People.getPassword())) {
            bindingResult.rejectValue("password", "Invalid", "Invalid Password!");
        }

        if (bindingResult.hasErrors()) {
            return null;
        }
        else {
            return People;
        }

    }

}
