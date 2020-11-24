// TODO: comment HourlyEmployee
package com.company.task_2;

public class HourlyEmployee extends Employee {
    private int hoursWorked;
    private int hourlyPayment;

    public HourlyEmployee() {
        super(name, afm);
    }

    public int getHoursWorked() {
        return this.hoursWorked;
    }

    public void setHoursWorked(int hoursWorked) {
        this.hoursWorked = hoursWorked;
    }

    public int getHourlyPayment() {
        return this.hourlyPayment;
    }

    public void setHourlyPayment(int hourlyPayment) {
        this.hourlyPayment = hourlyPayment;
    }

    public int payment() {
        return this.hoursWorked * this.hourlyPayment;
    }
}
