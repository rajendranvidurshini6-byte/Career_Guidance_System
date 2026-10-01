package controller;

import dao.CareerDAO;
import dao.QuestionDAO;
import util.SessionUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/quiz-legacy")
public class QuizServlet extends HttpServlet {
    // Identical body to QuestionServlet — kept for compatibility
    private final CareerDAO careerDAO = new CareerDAO();
    private final QuestionDAO questionDAO = new QuestionDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        if (!SessionUtil.isLoggedIn(req)) { res.sendRedirect("login.jsp"); return; }
        String cid = req.getParameter("careerId");
        if (cid == null) { res.sendRedirect("fields"); return; }
        try {
            int careerId = Integer.parseInt(cid);
            HttpSession s = req.getSession(true);
            s.setAttribute("currentCareerId", careerId);
            req.setAttribute("career", careerDAO.getCareerById(careerId));
            req.setAttribute("questions", questionDAO.getQuestionsByCareer(careerId));
            req.getRequestDispatcher("questions.jsp").forward(req, res);
        } catch (Exception e) { e.printStackTrace(); res.sendRedirect("fields"); }
    }
}