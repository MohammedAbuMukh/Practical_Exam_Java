package com.axsos.log_reg.controllers;


import com.axsos.log_reg.models.*;
import com.axsos.log_reg.services.PeopleService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class PeopleController {

    private final PeopleService PeopleService;
    public PeopleController(PeopleService PeopleService) {
        this.PeopleService = PeopleService;
    }

    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("newPeople", new People());
        model.addAttribute("newLogin", new LoginPeople());
        return "index";
    }

    @GetMapping("/home")
public String home(HttpSession session, Model model) {
    People loggedPeople = (People) session.getAttribute("loggedPeople");
    if (loggedPeople != null) {
        model.addAttribute("loggedPeople", loggedPeople); 
        return "home"; 
    } else {
        return "redirect:/"; 
    }
}

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    @PostMapping("/register")
    public String register(
            @Valid @ModelAttribute("newPeople") People newPeople,
            BindingResult bindingResult,
            Model model,
            HttpSession session
    ) {
        People loggedPeople = PeopleService.register(newPeople,bindingResult);
        if (bindingResult.hasErrors()) {
            model.addAttribute("newLogin", new People());
            return "index";
        }
        else {
            session.setAttribute("loggedPeople", loggedPeople);
            return "redirect:/home";
        }
    }

    @PostMapping("/login")
    public String login(
            @Valid @ModelAttribute("newLogin") LoginPeople newLogin, 
            BindingResult bindingResult,
            HttpSession session,
            Model model
    ) {
        People loggedPeople = PeopleService.login(newLogin, bindingResult); 
        if (bindingResult.hasErrors()) {
            model.addAttribute("newPeople", new People());
            return "index"; 
        } else {
            session.setAttribute("loggedPeople", loggedPeople); 
            return "redirect:/home"; 
        }
    }
}