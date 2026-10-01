package model;

public class Field {

    private int fieldId;
    private String fieldName;
    private String icon;
    private String description;

    public Field() { }

    public Field(int fieldId, String fieldName, String icon, String description) {
        this.fieldId = fieldId;
        this.fieldName = fieldName;
        this.icon = icon;
        this.description = description;
    }

    public int getFieldId() { return fieldId; }
    public void setFieldId(int fieldId) { this.fieldId = fieldId; }

    public String getFieldName() { return fieldName; }
    public void setFieldName(String fieldName) { this.fieldName = fieldName; }

    public String getIcon() { return icon; }
    public void setIcon(String icon) { this.icon = icon; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
}