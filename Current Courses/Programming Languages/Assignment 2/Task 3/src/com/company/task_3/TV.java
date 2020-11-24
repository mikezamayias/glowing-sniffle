package com.company.task_3;

public class TV extends Product {
    // tv attributes
    private int inches;
    private String color;
    private String tradeName;
    // tv constructor
    public TV() {
        super(id, name, image, price);
    }
    // getter of tv
    public int getInches() {
        return inches;
    }
    // getter of tv
    public String getColor() {
        return color;
    }
    // getter of tv
    public String getTradeName() {
        return tradeName;
    }
    // setter of tv
    public void setInches(int inches) {
        this.inches = inches;
    }
    // setter of tv
    public void setColor(String color) {
        this.color = color;
    }
    // setter of tv
    public void setTradeName(String tradeName) {
        this.tradeName = tradeName;
    }
}
