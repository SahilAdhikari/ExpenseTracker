package com.example.expensetracker.expense_tracker.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.expensetracker.expense_tracker.entities.Expense;

public interface ExpenseDao extends JpaRepository<Expense, String>{
    @Query(value = "SELECT * FROM Expense WHERE user_name = ?1", nativeQuery = true)
    List<Expense> findAllByUserName(String userName);
}
