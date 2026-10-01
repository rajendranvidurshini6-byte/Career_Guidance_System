package controller;

import dao.FieldDAO;
import util.SessionUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/quiz")
public class QuestionServlet extends HttpServlet {

    private final FieldDAO fieldDAO = new FieldDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        if (!SessionUtil.isLoggedIn(req)) {
            res.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        String fid = req.getParameter("fieldId");
        if (fid == null) {
            res.sendRedirect(req.getContextPath() + "/fields");
            return;
        }

        try {
            int fieldId = Integer.parseInt(fid);

            req.setAttribute("field",     fieldDAO.getFieldById(fieldId));
            req.setAttribute("questions", fieldDAO.getQuestionsByField(fieldId));

            HttpSession session = req.getSession(true);
            session.setAttribute("currentFieldId", fieldId);

            req.getRequestDispatcher("questions.jsp").forward(req, res);

        } catch (NumberFormatException e) {
            res.sendRedirect(req.getContextPath() + "/fields");
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errorMessage", "Could not load questions: " + e.getMessage());
            req.getRequestDispatcher("error.jsp").forward(req, res);
        }
    }
}