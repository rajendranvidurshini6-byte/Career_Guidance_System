package model;

/**
 * Result of an AI recommendation for one career.
 * NOTE: the field names use "spec" prefix for backwards compatibility
 * with the old results table, but semantically they now hold career data.
 */
public class Result {

    private int resultId;
    private int assessmentId;
    private int specId;              // now holds career_id
    private String specName;         // now holds career_name
    private String specDescription;  // now holds career description
    private double matchScore;

    public Result() { }

    public Result(int resultId, int assessmentId, int specId,
                  String specName, String specDescription, double matchScore) {
        this.resultId = resultId;
        this.assessmentId = assessmentId;
        this.specId = specId;
        this.specName = specName;
        this.specDescription = specDescription;
        this.matchScore = matchScore;
    }

    public int getResultId() { return resultId; }
    public void setResultId(int resultId) { this.resultId = resultId; }

    public int getAssessmentId() { return assessmentId; }
    public void setAssessmentId(int assessmentId) { this.assessmentId = assessmentId; }

    public int getSpecId() { return specId; }
    public void setSpecId(int specId) { this.specId = specId; }

    public String getSpecName() { return specName; }
    public void setSpecName(String specName) { this.specName = specName; }

    public String getSpecDescription() { return specDescription; }
    public void setSpecDescription(String specDescription) { this.specDescription = specDescription; }

    public double getMatchScore() { return matchScore; }
    public void setMatchScore(double matchScore) { this.matchScore = matchScore; }
}