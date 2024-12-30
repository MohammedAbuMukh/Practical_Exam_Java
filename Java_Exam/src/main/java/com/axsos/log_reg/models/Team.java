package com.axsos.log_reg.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotEmpty;
import java.util.List;

@Entity
public class Team {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotEmpty(message = "Team name is required!")
    private String name;

    @NotEmpty(message = "Skill level is required!")
    private String skillLevel;

    @NotEmpty(message = "Game day is required!")
    private String gameDay;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "creator_id")
    private People creator;

    @OneToMany(mappedBy = "team", fetch = FetchType.LAZY)
    private List<People> players;

    
    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSkillLevel() {
        return skillLevel;
    }

    public void setSkillLevel(String skillLevel) {
        this.skillLevel = skillLevel;
    }

    public String getGameDay() {
        return gameDay;
    }

    public void setGameDay(String gameDay) {
        this.gameDay = gameDay;
    }

    public People getCreator() {
        return creator;
    }

    public void setCreator(People creator) {
        this.creator = creator;
    }

    public List<People> getPlayers() {
        return players;
    }

    public void setPlayers(List<People> players) {
        this.players = players;
    }
}
