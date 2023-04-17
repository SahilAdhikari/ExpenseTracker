package com.example.expensetracker.expense_tracker.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.expensetracker.expense_tracker.dao.UserDao;
import com.example.expensetracker.expense_tracker.entities.User;

@Service
public class UserServiceImpl implements UserService {
    // List<Course> list;
    @Autowired
    private UserDao userDao;
    public UserServiceImpl() {
    }

    // User by its username
    @Override
    public Optional<User> getUserNyUserName(String userName) {
        return userDao.findById(userName);
    }

    // add user by userName and password
    @Override
    public User adduser(String userName, String password) {
        // TODO Auto-generated method stub
        User user = new User(userName, password);
        userDao.save(user);
        return user;
    }
    
    
    
}
