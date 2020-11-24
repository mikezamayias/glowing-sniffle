package com.company.task_2;

public class Earphone {
    // earphone variables
    private String brand;
    private int price;
    // earphone constructor
    public Earphone(String brand, int price) {
        this.brand = brand;
        this.price = price;
    }
    // getter of brand
    public String getBrand() {
        return brand;
    }
    // getter of price
    public int getPrice() {
        return price;
    }
    // setter of brand
    public void setBrand(String brand) {
        this.brand = brand;
    }
    // setter of price
    public void setPrice(int price) {
        this.price = price;
    }
}
