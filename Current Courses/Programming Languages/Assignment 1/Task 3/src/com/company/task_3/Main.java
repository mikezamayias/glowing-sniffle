package com.company.task_3;


public class Main {

    public static void main(String[] args) {
        int oldestBookIndex = 0;
        String[] titles = {
                "Sapiens: A Brief History of Humankind",
                "Homo Deus: A History of Tomorrow",
                "21 Lessons for the 21st Century"
        };
        String[] authors = {
                "Yuval Noah Harari",
                "Yuval Noah Harari",
                "Yuval Noah Harari"
        };
        int[] years = {
                2014,
                2017,
                2018
        };
        PDF[] pdfs = new PDF[3];
        for (int i = 0; i < pdfs.length; i++) {
            pdfs[i] = new PDF(titles[i], authors[i], years[i]);
        }
        for (int i = 0; i < pdfs.length; i++) {
            if (pdfs[i].getYear() < pdfs[oldestBookIndex].getYear()) {
                oldestBookIndex = i;
            }
        }
        System.out.printf(
                "Βιβλίο: %s, Συγγραφέας: %s, Έτος πρώτης έκδοσης: %d",
                pdfs[oldestBookIndex].getTitle(),
                pdfs[oldestBookIndex].getAuthor(),
                pdfs[oldestBookIndex].getYear()
        );
    }
}
