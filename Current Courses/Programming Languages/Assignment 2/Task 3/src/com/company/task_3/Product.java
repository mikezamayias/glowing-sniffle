package com.company.task_3;

public abstract class Product {
    protected static int id;
    protected static String name;
    protected static String image;
    protected static int price;

    public Product(int id, String name, String image, int price) {
        Product.id = id;
        Product.name = name;
        Product.image = image;
        Product.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        Product.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        Product.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        Product.image = image;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        Product.price = price;
    }
}
