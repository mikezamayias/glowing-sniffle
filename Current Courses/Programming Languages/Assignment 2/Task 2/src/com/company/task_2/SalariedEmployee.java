package com.company.task_2;

public class SalariedEmployee extends Employee {
    private int salary;

    public SalariedEmployee() {
        super(name, afm);
    }

    public void setSalary(int salary) {
        this.salary = salary;
    }

    public int payment() {
        return this.salary;
    }
}