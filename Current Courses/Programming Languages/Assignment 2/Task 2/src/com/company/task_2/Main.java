package com.company.task_2;

public class Main {

    public static void main(String[] args) {
        // array of employees
        Employee[] employees = new Employee[2];
        // instances of salaried and hourly employee
        SalariedEmployee salariedEmployee = new SalariedEmployee();
        HourlyEmployee hourlyEmployee = new HourlyEmployee();
        // populate employees array with above employee instances
        employees[0] = salariedEmployee;
        employees[1] = hourlyEmployee;
        // add data to salaried employee
        salariedEmployee.setName("Donald Duck");
        salariedEmployee.setAfm("nan");
        salariedEmployee.setSalary(0);
        // add data to hourly employee
        hourlyEmployee.setName("Chuck Norris");
        hourlyEmployee.setAfm("0");
        hourlyEmployee.setHourlyPayment(1000);
        hourlyEmployee.setHoursWorked(1);
        // print each employee's payment
        for (Employee employee : employees) {
            System.out.println(employee.payment());
        }
    }
}
