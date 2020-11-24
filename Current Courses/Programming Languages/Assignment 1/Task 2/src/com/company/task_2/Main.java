package com.company.task_2;


public class Main {

    public static void main(String[] args) {
        String[] brands = {
                "Apple",        // Airpods Pro
                "Apple",        // Airpods
                "Google",       // Pixel Buds
                "Microsoft",    // Surface Headphones 2
                "Sony"          // WH1000XM3
        };
        int[] prices = {
                (int) Math.round(249.00),
                (int) Math.round(159.00),
                (int) Math.round(179.00),
                (int) Math.round(249.00),
                (int) Math.round(349.99),
        };
        Earphone[] earphones = new Earphone[5];
        for (int i = 0; i < earphones.length; i++) {
            earphones[i] = new Earphone(brands[i], prices[i]);

        }
        for (int i = 0; i < earphones.length; i++) {
            System.out.printf("earphones[%d].getBrand() = %s%n", i, earphones[i].getBrand());
            System.out.printf("earphones[%d].getPrice() = %d%n", i, earphones[i].getPrice());
        }
    }
}
