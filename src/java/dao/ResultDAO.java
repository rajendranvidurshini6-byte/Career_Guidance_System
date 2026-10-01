package dao;

import model.Result;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ResultDAO {

    /** Save one career's match score for an assessment */
    public void saveResult(int assessmentId, int careerId, double score) throws SQLException {
        String sql = "INSERT INTO results (assessment_id, career_id, match_score) VALUES (?, ?, ?)";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, assessmentId);
            ps.setInt(2, careerId);
            ps.setDouble(3, score);
            ps.executeUpdate();
        }
    }

    /** Read all results for an assessment, ranked */
    public List<Result> getResultsByAssessment(int assessmentId) throws SQLException {
        List<Result> list = new ArrayList<>();
        String sql = "SELECT r.result_id, r.assessment_id, r.career_id, r.match_score, " +
                     "       c.career_name, c.description, c.icon " +
                     "FROM results r " +
                     "JOIN careers c ON c.career_id = r.career_id " +
                     "WHERE r.assessment_id = ? " +
                     "ORDER BY r.match_score DESC";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, assessmentId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Result r = new Result();
                    r.setResultId(rs.getInt("result_id"));
                    r.setAssessmentId(rs.getInt("assessment_id"));
                    r.setSpecId(rs.getInt("career_id"));       // reuse specId slot
                    r.setMatchScore(rs.getDouble("match_score"));
                    r.setSpecName(rs.getString("career_name"));
                    r.setSpecDescription(rs.getString("description"));
                    list.add(r);
                }
            }
        }
        return list;
    }
}