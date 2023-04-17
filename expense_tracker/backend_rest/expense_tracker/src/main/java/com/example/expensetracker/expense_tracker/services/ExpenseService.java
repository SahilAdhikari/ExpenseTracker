package com.example.expensetracker.expense_tracker.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.expensetracker.expense_tracker.entities.Expense;

public interface ExpenseService {
    public List<Expense> getAllExpenses();
    public Expense addExpense(Expense expense);

}
