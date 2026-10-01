package model;

public class Career {

    private int careerId;
    private int fieldId;
    private String careerName;
    private String icon;
    private String description;
    private double matchScore;   // populated by AI recommendation

    public Career() { }

    public Career(int careerId, int fieldId, String careerName, String icon, String description) {
        this.careerId = careerId;
        this.fieldId = fieldId;
        this.careerName = careerName;
        this.icon = icon;
        this.description = description;
    }

    public int getCareerId() { return careerId; }
    public void setCareerId(int careerId) { this.careerId = careerId; }

    public int getFieldId() { return fieldId; }
    public void setFieldId(int fieldId) { this.fieldId = fieldId; }

    public String getCareerName() { return careerName; }
    public void setCareerName(String careerName) { this.careerName = careerName; }

    public String getIcon() { return icon; }
    public void setIcon(String icon) { this.icon = icon; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public double getMatchScore() { return matchScore; }
    public void setMatchScore(double matchScore) { this.matchScore = matchScore; }
}