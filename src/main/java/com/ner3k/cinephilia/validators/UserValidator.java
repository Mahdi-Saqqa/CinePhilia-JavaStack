package com.ner3k.cinephilia.validators;

import com.ner3k.cinephilia.models.User;
import com.ner3k.cinephilia.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
@Component
public class UserValidator implements Validator {

    @Autowired
    private UserRepository userRepository;

    //    1
    @Override
    public boolean supports(Class<?> c) {
        return User.class.equals(c);
    }

    // 2
    @Override
    public void validate(Object object, Errors errors) {
        User user = (User) object;

        if (!user.getConfirmPassword().equals(user.getPassword())) {
            // 3
            errors.rejectValue("passwordConfirmation", "Match");
        }
        if(userRepository.existsByEmail(user.getEmail())){
            errors.rejectValue("email", "Match");
        }
        if(userRepository.existsByUsername(user.getUsername())){
            errors.rejectValue("username", "Match");
        }

    }
}