package com.company.task_3;

public class TV extends Product {
    private int inches;
    private String color;
    private String tradeName;

    public TV() {
        super(id, name, image, price);
    }

    public int getInches() {
        return inches;
    }

    public void setInches(int inches) {
        this.inches = inches;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getTrade_name() {
        return tradeName;
    }

    public void setTradeName(String tradeName) {
        this.tradeName = tradeName;
    }
}
