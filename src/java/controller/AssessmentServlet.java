package controller;

import dao.AnswerDAO;
import dao.AssessmentDAO;
import model.User;
import util.SessionUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/submitAssessment")
public class AssessmentServlet extends HttpServlet {

    private final AssessmentDAO assessmentDAO = new AssessmentDAO();
    private final AnswerDAO answerDAO = new AnswerDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        User user = SessionUtil.getLoggedUser(req);
        if (user == null) {
            res.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        HttpSession session = req.getSession(false);
        Integer fieldId = (Integer) session.getAttribute("currentFieldId");
        if (fieldId == null) {
            res.sendRedirect(req.getContextPath() + "/fields");
            return;
        }

        try {
            Map<Integer, Integer> answers = new HashMap<>();
            Enumeration<String> names = req.getParameterNames();
            while (names.hasMoreElements()) {
                String name = names.nextElement();
                if (name.startsWith("q_")) {
                    try {
                        int qid   = Integer.parseInt(name.substring(2));
                        int score = Integer.parseInt(req.getParameter(name));
                        if (score < 1 || score > 5) score = 3;
                        answers.put(qid, score);
                    } catch (NumberFormatException ignored) { }
                }
            }

            if (answers.isEmpty()) {
                res.sendRedirect(req.getContextPath() + "/quiz?fieldId=" + fieldId);
                return;
            }

            int assessmentId = assessmentDAO.createAssessmentForField(user.getUserId(), fieldId);
            answerDAO.saveAnswers(assessmentId, answers);

            session.setAttribute("lastAssessmentId", assessmentId);
            session.setAttribute("lastFieldId", fieldId);

            res.sendRedirect(req.getContextPath()
                    + "/result?assessmentId=" + assessmentId
                    + "&fieldId=" + fieldId);

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errorMessage", "Could not save assessment: " + e.getMessage());
            req.getRequestDispatcher("error.jsp").forward(req, res);
        }
    }
}