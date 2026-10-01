package model;

public class Question {

    private int questionId;
    private int fieldId;         // used in the new field-based flow
    private String questionText;
    private int weight;

    public Question() { }

    public Question(int questionId, int fieldId, String questionText, int weight) {
        this.questionId = questionId;
        this.fieldId = fieldId;
        this.questionText = questionText;
        this.weight = weight;
    }

    public int getQuestionId() { return questionId; }
    public void setQuestionId(int questionId) { this.questionId = questionId; }

    public int getFieldId() { return fieldId; }
    public void setFieldId(int fieldId) { this.fieldId = fieldId; }

    public String getQuestionText() { return questionText; }
    public void setQuestionText(String questionText) { this.questionText = questionText; }

    public int getWeight() { return weight; }
    public void setWeight(int weight) { this.weight = weight; }
}