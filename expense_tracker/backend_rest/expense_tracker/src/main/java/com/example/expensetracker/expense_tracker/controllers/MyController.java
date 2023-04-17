package com.example.expensetracker.expense_tracker.controllers;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.expensetracker.expense_tracker.entities.Expense;
import com.example.expensetracker.expense_tracker.entities.User;
import com.example.expensetracker.expense_tracker.services.ExpenseService;
import com.example.expensetracker.expense_tracker.services.UserService;


@RestController
public class MyController{
    //dependecy inject , object free mai mil jayega
    @Autowired
    private UserService userService;

    @Autowired
    private ExpenseService expenseService;
    

    @PostMapping(path = "/login", consumes = "application/json")
    public String loginAuth(@RequestBody User user) {
        Optional<User> dbUser = this.userService.getUserNyUserName(user.getUserName());
        // if userName is present
        if(dbUser.isPresent()) {
            // if pw matches        
            if(user.getPassword().equals(dbUser.get().getPassword())){
                return "2";
            }
            else{
                return "1";
            }
        }
        else{
            return "0";
        }

        // 2 -> correct pw, 1 -> wp, 0 - sign up
    }
    //add user
    @PostMapping(path = "/addUser")
    public User addUser(@RequestBody User user) {
        return this.userService.adduser(user.getUserName(), user.getPassword());
    }
    //get all expenses
    @GetMapping(path = "/expenses")
    public List<Expense> getAllExpenses() {
        return this.expenseService.getAllExpenses();
    }
    //add Expense
    @PostMapping(path = "/addExpense")
    public Expense addExpense(@RequestBody Expense expense) {
        return this.expenseService.addExpense(expense);
    }

    //get all expenses
    @GetMapping(path = "/expenses/{userName}")
    public List<Expense> getAllExpensesByUserName(@PathVariable String userName) {
        return this.expenseService.getAllExpensesByUserName(userName);
    }
    
}