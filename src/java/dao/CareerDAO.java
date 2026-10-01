package dao;

import model.Career;
import util.DBConnection;

import java.sql.*;
import java.util.*;

public class CareerDAO {

    // ============================================================
    // BASIC LOOKUPS
    // ============================================================

    public List<Career> getCareersByField(int fieldId) throws SQLException {
        List<Career> list = new ArrayList<>();
        String sql = "SELECT career_id, field_id, career_name, icon, description " +
                     "FROM careers WHERE field_id = ? ORDER BY career_id";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, fieldId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Career ca = new Career();
                    ca.setCareerId(rs.getInt("career_id"));
                    ca.setFieldId(rs.getInt("field_id"));
                    ca.setCareerName(rs.getString("career_name"));
                    ca.setIcon(rs.getString("icon"));
                    ca.setDescription(rs.getString("description"));
                    list.add(ca);
                }
            }
        }
        return list;
    }

    public Career getCareerById(int careerId) throws SQLException {
        String sql = "SELECT career_id, field_id, career_name, icon, description " +
                     "FROM careers WHERE career_id = ?";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, careerId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Career ca = new Career();
                    ca.setCareerId(rs.getInt("career_id"));
                    ca.setFieldId(rs.getInt("field_id"));
                    ca.setCareerName(rs.getString("career_name"));
                    ca.setIcon(rs.getString("icon"));
                    ca.setDescription(rs.getString("description"));
                    return ca;
                }
            }
        }
        return null;
    }

    /** Returns the field id used in an assessment (for the new flow) */
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

    // ============================================================
    // AI: LOAD ALL CAREERS IN A FIELD + THEIR WEIGHT VECTORS
    // ============================================================

    /**
     * Returns every career in the given field along with its weight vector
     * across the 15 field questions.
     *
     * Each entry:
     *   {
     *     career_id     : Integer,
     *     career_name   : String,
     *     icon          : String,
     *     description   : String,
     *     weights       : Map<Integer, Double>  (question_id -> weight)
     *   }
     */
    public List<Map<String, Object>> getCareersWithWeightsByField(int fieldId) throws SQLException {
        List<Map<String, Object>> out = new ArrayList<>();
        String sql = "SELECT career_id, career_name, icon, description " +
                     "FROM careers WHERE field_id = ? ORDER BY career_id";

        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {

            ps.setInt(1, fieldId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Map<String, Object> row = new HashMap<>();
                    int cid = rs.getInt("career_id");

                    row.put("career_id",   cid);
                    row.put("career_name", rs.getString("career_name"));
                    row.put("icon",        rs.getString("icon"));
                    row.put("description", rs.getString("description"));

                    Map<Integer, Double> weights = new HashMap<>();
                    String wsql = "SELECT question_id, weight FROM career_question_weights " +
                                  "WHERE career_id = ?";
                    try (PreparedStatement ps2 = c.prepareStatement(wsql)) {
                        ps2.setInt(1, cid);
                        try (ResultSet rs2 = ps2.executeQuery()) {
                            while (rs2.next()) {
                                weights.put(rs2.getInt("question_id"),
                                            rs2.getDouble("weight"));
                            }
                        }
                    }
                    row.put("weights", weights);
                    out.add(row);
                }
            }
        }
        return out;
    }

    // ============================================================
    // SKILLS TO IMPROVE FOR A CAREER
    // ============================================================

    public List<Map<String, String>> getSkillsForCareer(int careerId) throws SQLException {
        List<Map<String, String>> list = new ArrayList<>();
        String sql = "SELECT skill, level, priority FROM career_skills " +
                     "WHERE career_id = ? ORDER BY skill";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, careerId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Map<String, String> m = new HashMap<>();
                    m.put("skill",    rs.getString("skill"));
                    m.put("level",    rs.getString("level"));
                    m.put("priority", rs.getString("priority"));
                    list.add(m);
                }
            }
        }
        return list;
    }

    // ============================================================
    // ROADMAP FOR A CAREER
    // ============================================================

    public List<Map<String, String>> getRoadmapForCareer(int careerId) throws SQLException {
        List<Map<String, String>> list = new ArrayList<>();
        String sql = "SELECT step_no, title, detail FROM career_roadmap " +
                     "WHERE career_id = ? ORDER BY step_no";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, careerId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Map<String, String> m = new HashMap<>();
                    m.put("title",  rs.getString("title"));
                    m.put("detail", rs.getString("detail"));
                    list.add(m);
                }
            }
        }
        return list;
    }
}