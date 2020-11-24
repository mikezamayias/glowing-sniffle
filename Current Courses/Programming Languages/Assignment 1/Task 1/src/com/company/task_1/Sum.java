package com.company.task_1;

public class Sum {
    // private property
    private int sum;

    public Sum(int sum) {
        this.sum = sum;
    }

    public void calculateSum(int N) {
        for (int i = 0; i <= Math.pow(N, 2); i++) {
            this.sum+=i;
        }
    }

    public int getSum() {
        return this.sum;
    }

    public void printSum() {
        System.out.println(this.sum);
    }
}
