package controller;

import dao.CareerDAO;
import model.Career;
import service.RecommendationService;
import util.SessionUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/result")
public class ResultServlet extends HttpServlet {

    private final RecommendationService rec = new RecommendationService();
    private final CareerDAO careerDAO = new CareerDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        if (!SessionUtil.isLoggedIn(req)) {
            res.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        String idParam = req.getParameter("assessmentId");
        String fParam  = req.getParameter("fieldId");

        if (idParam == null || fParam == null) {
            res.sendRedirect(req.getContextPath() + "/profile");
            return;
        }

        try {
            int assessmentId = Integer.parseInt(idParam);
            int fieldId      = Integer.parseInt(fParam);

            List<Career> top5 = rec.recommendTop5(assessmentId, fieldId);
            Career top = top5.isEmpty() ? null : top5.get(0);

            req.setAttribute("top5", top5);
            req.setAttribute("top", top);
            req.setAttribute("assessmentId", assessmentId);
            req.setAttribute("fieldId", fieldId);

            if (top != null) {
                req.setAttribute("skills",  careerDAO.getSkillsForCareer(top.getCareerId()));
                req.setAttribute("roadmap", careerDAO.getRoadmapForCareer(top.getCareerId()));
            }

            req.getRequestDispatcher("result.jsp").forward(req, res);

        } catch (NumberFormatException e) {
            res.sendRedirect(req.getContextPath() + "/profile");
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errorMessage", "Could not compute results: " + e.getMessage());
            req.getRequestDispatcher("error.jsp").forward(req, res);
        }
    }
}