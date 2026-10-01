package dao;

import model.Assessment;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AssessmentDAO {

    /** Creates a new assessment row for the new field-based flow */
    public int createAssessmentForField(int userId, int fieldId) throws SQLException {
        String sql = "INSERT INTO assessments (user_id, field_id) VALUES (?, ?)";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, userId);
            ps.setInt(2, fieldId);
            ps.executeUpdate();
            try (ResultSet keys = ps.getGeneratedKeys()) {
                if (keys.next()) return keys.getInt(1);
            }
        }
        return -1;
    }

    /** History for the /profile and /dashboard pages */
    public List<Assessment> getAssessmentsByUser(int userId) throws SQLException {
        List<Assessment> list = new ArrayList<>();
        String sql = "SELECT a.assessment_id, a.user_id, a.field_id, a.taken_at, " +
                     "       f.field_name " +
                     "FROM assessments a " +
                     "LEFT JOIN fields f ON a.field_id = f.field_id " +
                     "WHERE a.user_id = ? " +
                     "ORDER BY a.taken_at DESC";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Assessment a = new Assessment();
                    a.setAssessmentId(rs.getInt("assessment_id"));
                    a.setUserId(rs.getInt("user_id"));
                    a.setFieldId(rs.getInt("field_id"));
                    a.setFieldName(rs.getString("field_name"));
                    a.setTakenAt(rs.getTimestamp("taken_at"));
                    list.add(a);
                }
            }
        }
        return list;
    }

    /** Field id lookup for result page */
    public int getFieldIdByAssessment(int assessmentId) throws SQLException {
        String sql = "SELECT field_id FROM assessments WHERE assessment_id = ?";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, assessmentId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return rs.getInt("field_id");
            }
        }
        return -1;
    }
}