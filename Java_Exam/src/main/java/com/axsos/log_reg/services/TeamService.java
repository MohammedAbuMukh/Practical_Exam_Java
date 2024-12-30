package com.axsos.log_reg.services;

import com.axsos.log_reg.models.*;
import com.axsos.log_reg.repositories.*;
import org.springframework.stereotype.Service;

@Service
public class TeamService {
    private final TeamRepository teamRepository;
    private final PeopleRepository peopleRepository;

    public TeamService(TeamRepository teamRepository, PeopleRepository peopleRepository) {
        this.teamRepository = teamRepository;
        this.peopleRepository = peopleRepository;
    }

    public Team createTeam(Team newTeam, People creator) {
        newTeam.setCreator(creator);
        return teamRepository.save(newTeam);
    }

    public Team findById(Long id) {
        return teamRepository.findById(id).orElse(null);
    }

    public void addPlayerToTeam(Long teamId, People player) {
        Team team = teamRepository.findById(teamId).orElse(null);
        if (team != null) {
            player.setTeam(team);
            peopleRepository.save(player);
        }
    }

    public void updateTeam(Long id, Team updatedTeam) {
        Team existingTeam = teamRepository.findById(id).orElse(null);
        if (existingTeam != null) {
            existingTeam.setName(updatedTeam.getName());
            existingTeam.setSkillLevel(updatedTeam.getSkillLevel());
            existingTeam.setGameDay(updatedTeam.getGameDay());
            teamRepository.save(existingTeam);
        }
    }

    public void deleteTeam(Long id) {
        teamRepository.deleteById(id);
    }
}
