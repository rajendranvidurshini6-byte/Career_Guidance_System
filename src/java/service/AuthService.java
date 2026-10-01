package service;

import dao.UserDAO;
import model.User;
import util.PasswordUtil;

public class AuthService {

    private final UserDAO userDAO = new UserDAO();

    /**
     * Login check — returns the User if valid, null otherwise
     */
    public User login(String email, String password) throws Exception {
        if (email == null || password == null) return null;
        User u = userDAO.findByEmail(email.trim());
        if (u == null) return null;
        if (!PasswordUtil.checkPassword(password, u.getPasswordHash())) return null;
        return u;
    }

    /**
     * Register a new user — returns true if created, false if email exists
     */
    public boolean register(String fullName, String email, String password) throws Exception {
        if (userDAO.emailExists(email)) return false;

        User u = new User();
        u.setFullName(fullName);
        u.setEmail(email);
        u.setPasswordHash(PasswordUtil.hashPassword(password));

        return userDAO.register(u) > 0;
    }
}