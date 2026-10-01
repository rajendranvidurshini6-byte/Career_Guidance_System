package controller;

import dao.AssessmentDAO;
import model.User;
import util.SessionUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {

    private final AssessmentDAO assessmentDAO = new AssessmentDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        User user = SessionUtil.getLoggedUser(req);
        if (user == null) {
            res.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        try {
            req.setAttribute("user", user);
            req.setAttribute("history", assessmentDAO.getAssessmentsByUser(user.getUserId()));
            req.getRequestDispatcher("profile.jsp").forward(req, res);
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errorMessage", "Could not load profile: " + e.getMessage());
            req.getRequestDispatcher("error.jsp").forward(req, res);
        }
    }
}