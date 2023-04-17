package com.example.expensetracker.expense_tracker.entities;
import java.time.LocalDateTime;
import java.util.Date;

import javax.print.attribute.standard.DateTimeAtCreation;

import jakarta.persistence.*;
@Entity
public class Expense {
  @Id
  private String expenseId;

  private String userName;
  private String category;
  private String amount;
  private String dateTime;

  public Expense(){}
  public Expense(String userName, String category, String amount, String dateTime, String expenseId) {
    this.category = category;
    this.userName = userName;
    this.amount = amount;
    this.dateTime = dateTime;
    this.expenseId = expenseId;
    // will always be unique
    // this.expenseId = LocalDateTime.now() + userName;
  }
  //getters and setters
  public String getAmount() {
      return amount;
  }
  public String getCategory() {
      return category;
  }
  public String getDateTime() {
      return dateTime;
  }
  public String getExpenseId() {
      return expenseId;
  }
  public String getUserName() {
      return userName;
  }
  public void setAmount(String amount) {
      this.amount = amount;
  }
  public void setCategory(String category) {
      this.category = category;
  }
  public void setDateTime(String dateTime) {
      this.dateTime = dateTime;
  }
  public void setExpenseId(String expenseId) {
      this.expenseId = expenseId;
  }
  public void setUserName(String userName) {
      this.userName = userName;
  }
  
}
