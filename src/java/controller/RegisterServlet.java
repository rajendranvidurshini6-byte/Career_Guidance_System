package controller;

import service.AuthService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private final AuthService authService = new AuthService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.getRequestDispatcher("register.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String fullName = trim(req.getParameter("fullName"));
        String email    = trim(req.getParameter("email"));
        String password = req.getParameter("password");
        String confirm  = req.getParameter("confirmPassword");

        if (fullName.isEmpty() || email.isEmpty() || password == null || password.isEmpty()) {
            forwardError(req, res, "All fields are required.");
            return;
        }
        if (password.length() < 6) {
            forwardError(req, res, "Password must be at least 6 characters.");
            return;
        }
        if (!password.equals(confirm)) {
            forwardError(req, res, "Passwords do not match.");
            return;
        }

        try {
            if (authService.register(fullName, email, password)) {
                res.sendRedirect(req.getContextPath() + "/login.jsp?registered=1");
            } else {
                forwardError(req, res, "Email already registered.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            forwardError(req, res, "Server error: " + e.getMessage());
        }
    }

    private void forwardError(HttpServletRequest req, HttpServletResponse res, String msg)
            throws ServletException, IOException {
        req.setAttribute("error", msg);
        req.setAttribute("fullName", req.getParameter("fullName"));
        req.setAttribute("email", req.getParameter("email"));
        req.getRequestDispatcher("register.jsp").forward(req, res);
    }

    private String trim(String s) { return s == null ? "" : s.trim(); }
}