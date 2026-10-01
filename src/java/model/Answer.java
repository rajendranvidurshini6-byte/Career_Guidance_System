package model;

public class Answer {

    private int answerId;
    private int assessmentId;
    private int questionId;
    private int score;

    public Answer() { }

    public Answer(int answerId, int assessmentId, int questionId, int score) {
        this.answerId = answerId;
        this.assessmentId = assessmentId;
        this.questionId = questionId;
        this.score = score;
    }

    public int getAnswerId() { return answerId; }
    public void setAnswerId(int answerId) { this.answerId = answerId; }

    public int getAssessmentId() { return assessmentId; }
    public void setAssessmentId(int assessmentId) { this.assessmentId = assessmentId; }

    public int getQuestionId() { return questionId; }
    public void setQuestionId(int questionId) { this.questionId = questionId; }

    public int getScore() { return score; }
    public void setScore(int score) { this.score = score; }
}