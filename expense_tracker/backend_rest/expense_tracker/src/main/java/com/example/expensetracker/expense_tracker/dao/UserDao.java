package com.example.expensetracker.expense_tracker.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.expensetracker.expense_tracker.entities.User;

public interface UserDao extends JpaRepository<User, String>{
    
}
