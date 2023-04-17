package  com.example.expensetracker.expense_tracker.services;

import java.util.*;

import org.springframework.stereotype.Service;

import com.example.expensetracker.expense_tracker.entities.User;;

public interface UserService {
    // public List<Us> getCoursess();

    // public Course getCourse(long courseId);

    // public Course addCourse(Course course);

    // public Course updateCourse(Course course);

    // public void deleteCourse(Long courseId);

    public Optional<User> getUserNyUserName(String userName);    
    public User adduser(String userName, String password);
}
