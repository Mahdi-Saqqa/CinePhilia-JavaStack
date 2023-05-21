package com.ner3k.cinephilia.services;

import com.ner3k.cinephilia.models.Movie;
import com.ner3k.cinephilia.models.Role;
import com.ner3k.cinephilia.models.User;
import com.ner3k.cinephilia.repositories.RoleRepository;
import com.ner3k.cinephilia.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;


    // 1
    public void saveWithUserRole(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setRoles(roleRepository.findByName("ROLE_USER"));
        userRepository.save(user);
    }

    // 2
    public void saveUserWithAdminRole(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setRoles(roleRepository.findByName("ROLE_ADMIN"));

        userRepository.save(user);
    }

    // 3
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    public User findByEmail(String email) {
        if(userRepository.findUserByEmail(email).isPresent()){
            return userRepository.findUserByEmail(email).get();
        }
        else return null;
    }
    public User save(User user) {
        return userRepository.save(user);
    }


    public User update(User currentUser) {
        return userRepository.save(currentUser);
    }
}