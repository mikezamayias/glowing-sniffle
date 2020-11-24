package com.company.task_1;

import java.lang.Math;
import java.util.Scanner;


public class Main {

    public static void main(String[] args) {
        // new scanner
        Scanner scanner = new Scanner(System.in);
        // create vars n, sum
        int n, sum = 0;
        // ask user for a positive integer to assign to n
        do {
            System.out.println("Enter a positive integer, n:");
            n = scanner.nextInt();
        } while (n <= 0);
        // procedural programming implementation
        for (int i = 1; i <= (int) Math.pow(n, 2); i++) {
            sum += i;
        }
        System.out.println("sum = " + sum);
        System.out.println(sum);
        // oop implementation
        Sum oop_sum = new Sum(0);
        oop_sum.calculateSum(n);
        System.out.println("oop_sum.getSum() = " + oop_sum.getSum());
        oop_sum.printSum();
    }
}
