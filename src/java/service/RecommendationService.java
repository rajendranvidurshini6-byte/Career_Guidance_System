package service;

import dao.AnswerDAO;
import dao.CareerDAO;
import model.Career;

import java.util.*;

/**
 * AI recommendation engine.
 *
 * Uses cosine similarity between the user's 15 answers and each career's
 * weight vector. Returns the top 5 careers in the chosen field, ranked
 * by match score.
 */
public class RecommendationService {

    private final AnswerDAO answerDAO = new AnswerDAO();
    private final CareerDAO careerDAO = new CareerDAO();

    /**
     * @param assessmentId  the current assessment
     * @param fieldId       the field the user picked
     * @return top 5 careers, sorted by match score (highest first)
     */
    public List<Career> recommendTop5(int assessmentId, int fieldId) throws Exception {

        // 1. Load user's answers (question_id -> score 1..5)
        Map<Integer, Integer> userAnswers = answerDAO.getScores(assessmentId);

        // 2. Load all careers in the field, each with its weight vector
        List<Map<String, Object>> careers = careerDAO.getCareersWithWeightsByField(fieldId);

        List<Career> ranked = new ArrayList<>();

        // 3. Compute cosine similarity for each career
        for (Map<String, Object> row : careers) {

            @SuppressWarnings("unchecked")
            Map<Integer, Double> weights = (Map<Integer, Double>) row.get("weights");

            double dot   = 0.0;
            double normA = 0.0;
            double normB = 0.0;

            // Union of all question ids from either vector
            Set<Integer> qIds = new HashSet<>();
            qIds.addAll(weights.keySet());
            qIds.addAll(userAnswers.keySet());

            for (Integer qid : qIds) {
                double a = userAnswers.getOrDefault(qid, 0);     // user's score (0 if unanswered)
                double b = weights.getOrDefault(qid, 0.0);       // career's weight
                dot   += a * b;
                normA += a * a;
                normB += b * b;
            }

            double sim;
            if (normA == 0 || normB == 0) {
                sim = 0.0;
            } else {
                sim = dot / (Math.sqrt(normA) * Math.sqrt(normB));
            }

            // Convert to 2-decimal percentage
            double percent = Math.round(sim * 10000.0) / 100.0;

            // Build Career object
            Career c = new Career();
            c.setCareerId((Integer) row.get("career_id"));
            c.setCareerName((String) row.get("career_name"));
            c.setIcon((String) row.get("icon"));
            c.setDescription((String) row.get("description"));
            c.setFieldId(fieldId);
            c.setMatchScore(percent);

            ranked.add(c);
        }

        // 4. Sort by score descending
        ranked.sort(new Comparator<Career>() {
            @Override
            public int compare(Career a, Career b) {
                return Double.compare(b.getMatchScore(), a.getMatchScore());
            }
        });

        // 5. Return top 5
        if (ranked.size() > 5) {
            return new ArrayList<>(ranked.subList(0, 5));
        }
        return ranked;
    }
}