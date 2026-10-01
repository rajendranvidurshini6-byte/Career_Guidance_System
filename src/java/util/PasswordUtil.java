package util;

import org.mindrot.jbcrypt.BCrypt;

public class PasswordUtil {

    /** Hash a plain password with BCrypt */
    public static String hashPassword(String plain) {
        return BCrypt.hashpw(plain, BCrypt.gensalt(12));
    }

    /** Verify a plain password against a stored BCrypt hash */
    public static boolean checkPassword(String plain, String hashed) {
        if (hashed == null || !hashed.startsWith("$2")) return false;
        try {
            return BCrypt.checkpw(plain, hashed);
        } catch (Exception e) {
            return false;
        }
    }
}