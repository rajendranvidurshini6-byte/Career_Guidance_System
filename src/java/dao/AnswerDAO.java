package dao;

import util.DBConnection;

import java.sql.*;
import java.util.HashMap;
import java.util.Map;

public class AnswerDAO {

    public void saveAnswers(int assessmentId, Map<Integer, Integer> answers) throws SQLException {
        String sql = "INSERT INTO answers (assessment_id, question_id, score) VALUES (?, ?, ?)";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            for (Map.Entry<Integer, Integer> e : answers.entrySet()) {
                ps.setInt(1, assessmentId);
                ps.setInt(2, e.getKey());
                ps.setInt(3, e.getValue());
                ps.addBatch();
            }
            ps.executeBatch();
        }
    }

    public Map<Integer, Integer> getScores(int assessmentId) throws SQLException {
        Map<Integer, Integer> map = new HashMap<>();
        String sql = "SELECT question_id, score FROM answers WHERE assessment_id = ?";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, assessmentId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    map.put(rs.getInt("question_id"), rs.getInt("score"));
                }
            }
        }
        return map;
    }
}