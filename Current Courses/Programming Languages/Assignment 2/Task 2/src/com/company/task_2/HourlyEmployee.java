package com.company.task_2;

public class HourlyEmployee extends Employee {
    // hourly employee attributes
    private int hoursWorked;
    private int hourlyPayment;
    // hourly employee constructor
    public HourlyEmployee() {
        super(name, afm);
    }
    // getter of hourly employee
    public int getHoursWorked() {
        return this.hoursWorked;
    }
    // getter of hourly employee
    public int getHourlyPayment() {
        return this.hourlyPayment;
    }
    // setter of hourly employee
    public void setHoursWorked(int hoursWorked) {
        this.hoursWorked = hoursWorked;
    }
    // setter of hourly employee
    public void setHourlyPayment(int hourlyPayment) {
        this.hourlyPayment = hourlyPayment;
    }
    // method of hourly employee
    public int payment() {
        return this.hoursWorked * this.hourlyPayment;
    }
}
