package  com.example.expensetracker.expense_tracker.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class User {
    @Id
    private String userName;
    private String password;
    private String targetAmount = "30000";

    //contstuctors
    public User(){}

    public User(String userName, String passWord) {
        super();
        this.userName = userName;
        this.password = passWord;
    }

    // getters and setters
    public String getPassword() {
        return password;
    }
    public String getTargetAmount() {
        return targetAmount;
    }
    public String getUserName() {
        return userName;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public void setTargetAmount(String targetAmount) {
        this.targetAmount = targetAmount;
    }
    public void setUserName(String userName) {
        this.userName = userName;
    }

    //
    
}
