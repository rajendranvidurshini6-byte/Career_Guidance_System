package controller;

import dao.CareerDAO;
import dao.FieldDAO;
import util.SessionUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/careers")
public class CareerServlet extends HttpServlet {

    private final CareerDAO careerDAO = new CareerDAO();
    private final FieldDAO  fieldDAO  = new FieldDAO();

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
            req.setAttribute("field",   fieldDAO.getFieldById(fieldId));
            req.setAttribute("careers", careerDAO.getCareersByField(fieldId));
            req.getRequestDispatcher("fields.jsp").forward(req, res);
        } catch (Exception e) {
            e.printStackTrace();
            res.sendRedirect(req.getContextPath() + "/fields");
        }
    }
}