package model;

import java.sql.Timestamp;

public class Assessment {

    private int assessmentId;
    private int userId;
    private int fieldId;
    private String fieldName;      // populated by JOIN in DAO
    private Timestamp takenAt;

    public Assessment() { }

    public int getAssessmentId() { return assessmentId; }
    public void setAssessmentId(int assessmentId) { this.assessmentId = assessmentId; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public int getFieldId() { return fieldId; }
    public void setFieldId(int fieldId) { this.fieldId = fieldId; }

    public String getFieldName() { return fieldName; }
    public void setFieldName(String fieldName) { this.fieldName = fieldName; }

    public Timestamp getTakenAt() { return takenAt; }
    public void setTakenAt(Timestamp takenAt) { this.takenAt = takenAt; }
}