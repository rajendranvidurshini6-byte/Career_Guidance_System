package dao;

import model.Field;
import model.Question;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FieldDAO {

    /** All 50+ fields for the /fields page */
    public List<Field> getAllFields() throws SQLException {
        List<Field> list = new ArrayList<>();
        String sql = "SELECT field_id, field_name, icon, description FROM fields ORDER BY field_id";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Field f = new Field();
                f.setFieldId(rs.getInt("field_id"));
                f.setFieldName(rs.getString("field_name"));
                f.setIcon(rs.getString("icon"));
                f.setDescription(rs.getString("description"));
                list.add(f);
            }
        }
        return list;
    }

    /** One field by id */
    public Field getFieldById(int fieldId) throws SQLException {
        String sql = "SELECT field_id, field_name, icon, description FROM fields WHERE field_id = ?";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, fieldId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Field f = new Field();
                    f.setFieldId(rs.getInt("field_id"));
                    f.setFieldName(rs.getString("field_name"));
                    f.setIcon(rs.getString("icon"));
                    f.setDescription(rs.getString("description"));
                    return f;
                }
            }
        }
        return null;
    }

    /** The 15 field-specific questions for the /quiz page */
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
}