package controller;

import dao.FieldDAO;
import util.SessionUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/fields")
public class FieldServlet extends HttpServlet {

    private final FieldDAO fieldDAO = new FieldDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        if (!SessionUtil.isLoggedIn(req)) {
            res.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        try {
            req.setAttribute("fields", fieldDAO.getAllFields());
            req.getRequestDispatcher("fields.jsp").forward(req, res);
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errorMessage", "Could not load fields: " + e.getMessage());
            req.getRequestDispatcher("error.jsp").forward(req, res);
        }
    }
}