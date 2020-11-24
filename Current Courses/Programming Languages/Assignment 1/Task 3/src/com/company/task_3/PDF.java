package com.company.task_3;


public class PDF {
    // pdf variables
    private String title;
    private String author;
    private int year;

    // pdf constructor
    public PDF(String title, String author, int year) {
        this.title = title;
        this.author = author;
        this.year = year;
    }

    // getter of title
    public String getTitle() {
        return title;
    }

    // setter of title
    public void setTitle(String title) {
        this.title = title;
    }

    // getter of author
    public String getAuthor() {
        return author;
    }

    // setter of author
    public void setAuthor(String author) {
        this.author = author;
    }

    // getter of year
    public int getYear() {
        return year;
    }

    // setter of title
    public void setYear(int year) {
        this.year = year;
    }
}
