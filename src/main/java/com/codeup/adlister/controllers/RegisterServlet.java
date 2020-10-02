package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.sql.SQLException;


@WebServlet(name = "controllers.RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
    }

  //  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordConfirmation = request.getParameter("confirm_password");


        // validate input
        boolean inputHasErrors = username.isEmpty()
                || email.isEmpty()
                || password.isEmpty()
                || (!password.equals(passwordConfirmation));


        if (inputHasErrors) {
            request.setAttribute("error", "Passwords do not match!");
            request.setAttribute("stickyEmail", email);
            request.setAttribute("stickyUser", username);
            request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
            return;
        }

        //get all users in database
        List<User> allUsers = DaoFactory.getUsersDao().getAllUsers();
        for(User user: allUsers){
            if(user.getUsername() == username){
                request.setAttribute("errorMessage", "Oh niet!");

            }

        }
        // create and save a new user
        User user = new User(username, email, password);

        try {
            DaoFactory.getUsersDao().insert(user);
            response.sendRedirect("/login");
        } catch (RuntimeException e) {

            response.sendRedirect("/register");

            e.printStackTrace();

            SQLException se = (SQLException) e.getCause();
            System.out.println(se.getSQLState());
            if ("23000".equals(se.getSQLState())) {
                request.setAttribute("error", "That username already exists!");
            } else {
                request.setAttribute("error", "Invalid Login!");
            }

            request.setAttribute("stickyEmail", email);
            request.setAttribute("stickyUser", username);
            request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);

        }
    }
}