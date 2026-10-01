package util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.User;

public class SessionUtil {

    public static final String USER_KEY = "loggedUser";

    /** Returns the currently logged-in user, or null */
    public static User getLoggedUser(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null) return null;
        return (User) session.getAttribute(USER_KEY);
    }

    /** True if someone is logged in */
    public static boolean isLoggedIn(HttpServletRequest request) {
        return getLoggedUser(request) != null;
    }

    /** Manually log in a user */
    public static void setLoggedUser(HttpServletRequest request, User user) {
        HttpSession session = request.getSession(true);
        session.setAttribute(USER_KEY, user);
        session.setMaxInactiveInterval(30 * 60);   // 30 minutes
    }

    /** Log out the current user */
    public static void clear(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) session.invalidate();
    }
}