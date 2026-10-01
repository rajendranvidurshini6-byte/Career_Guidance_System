package dao;

import model.Question;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class QuestionDAO {

    /** Kept for backwards compatibility — returns field questions */
    public List<Question> getQuestionsByField(int fieldId) throws SQLException {
        List<Question> list = new ArrayList<>();
        String sql = "SELECT question_id, question_text FROM field_questions " +
                     "WHERE field_id = ? ORDER BY q_no";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, fieldId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Question q = new Question();
                    q.setQuestionId(rs.getInt("question_id"));
                    q.setQuestionText(rs.getString("question_text"));
                    q.setFieldId(fieldId);
                    list.add(q);
                }
            }
        }
        return list;
    }

    public Object getQuestionsByCareer(int careerId) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}