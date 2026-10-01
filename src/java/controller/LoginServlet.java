package controller;

import dao.UserDAO;
import model.User;
import util.PasswordUtil;
import util.SessionUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private final UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.getRequestDispatcher("login.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String email    = req.getParameter("email");
        String password = req.getParameter("password");

        if (email == null || password == null || email.trim().isEmpty() || password.isEmpty()) {
            forwardError(req, res, "Email and password are required.");
            return;
        }

        try {
            User u = userDAO.findByEmail(email.trim());
            if (u == null || !PasswordUtil.checkPassword(password, u.getPasswordHash())) {
                forwardError(req, res, "Invalid email or password.");
                return;
            }

            HttpSession session = req.getSession(true);
            session.setAttribute(SessionUtil.USER_KEY, u);
            session.setMaxInactiveInterval(30 * 60);

            res.sendRedirect(req.getContextPath() + "/dashboard");

        } catch (Exception e) {
            e.printStackTrace();
            forwardError(req, res, "Server error: " + e.getMessage());
        }
    }

    private void forwardError(HttpServletRequest req, HttpServletResponse res, String msg)
            throws ServletException, IOException {
        req.setAttribute("error", msg);
        req.setAttribute("email", req.getParameter("email"));
        req.getRequestDispatcher("login.jsp").forward(req, res);
    }
}