package org.hidxop.service;

import jakarta.transaction.Transactional;
import org.hidxop.entity.User;
import org.hidxop.repository.UserRepository;
import java.util.List;

@Transactional
public class UserService {



    private UserRepository userRepository;

    public UserService() {
    }

    public void setUserRepository(UserRepository userRepository) {
        this.userRepository = userRepository;
    }


    public void saveUser(User user) {
        userRepository.save(user);
    }

    public User updateUser(User user) {
        return userRepository.save(user);
    }

    public User getUserById(Long id) {
        return userRepository.findById(id).orElse(null);
    }

    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    public void deleteUser(Long id) {
        userRepository.deleteById(id);
    }
}