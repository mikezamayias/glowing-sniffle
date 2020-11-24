package com.company.task_2;

public class SalariedEmployee extends Employee {
    // salaried employee attributes
    private int salary;
    // salaried employee constructor
    public SalariedEmployee() {
        super(name, afm);
    }
    // setter of salaried employee
    public void setSalary(int salary) {
        this.salary = salary;
    }
    // method of salaried employee
    public int payment() {
        return this.salary;
    }
}