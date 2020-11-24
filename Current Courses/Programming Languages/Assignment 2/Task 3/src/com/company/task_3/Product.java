package com.company.task_3;

public abstract class Product {
    // product attributes
    protected static int id;
    protected static String name;
    protected static String image;
    protected static int price;
    // product constructor
    public Product(int id, String name, String image, int price) {
        Product.id = id;
        Product.name = name;
        Product.image = image;
        Product.price = price;
    }
    // getter of product
    public int getId() {
        return id;
    }
    // getter of product
    public String getName() {
        return name;
    }
    // getter of product
    public String getImage() {
        return image;
    }
    // getter of product
    public int getPrice() {
        return price;
    }
    // setter of product
    public void setId(int id) {
        Product.id = id;
    }
    // setter of product
    public void setName(String name) {
        Product.name = name;
    }
    // setter of product
    public void setImage(String image) {
        Product.image = image;
    }
    // setter of product
    public void setPrice(int price) {
        Product.price = price;
    }
}
