package com.example.expensetracker.expense_tracker.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.expensetracker.expense_tracker.dao.ExpenseDao;
import com.example.expensetracker.expense_tracker.entities.Expense;
@Service
public class ExpenseServiceImpl implements ExpenseService{
    @Autowired
    private ExpenseDao expenseDao;
    public ExpenseServiceImpl() {
    }
    @Override
    public List<Expense> getAllExpenses() {
        return expenseDao.findAll();
    }
    @Override
    public Expense addExpense(Expense expense) {
        expenseDao.save(expense);
        return expense;
    }
    @Override
    public List<Expense> getAllExpensesByUserName(String userName) {
        // TODO Auto-generated method stub
         return expenseDao.findAllByUserName(userName);
    }
    
}
