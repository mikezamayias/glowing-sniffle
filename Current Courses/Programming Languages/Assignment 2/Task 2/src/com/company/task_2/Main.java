// TODO: comment Main
package com.company.task_2;

public class Main {

    public static void main(String[] args) {
        Employee[] employees = new Employee[2];

        SalariedEmployee salariedEmployee = new SalariedEmployee();
        HourlyEmployee hourlyEmployee = new HourlyEmployee();

        employees[0] = salariedEmployee;
        employees[1] = hourlyEmployee;

        salariedEmployee.setName("Donald Duck");
        salariedEmployee.setAfm("nan");
        salariedEmployee.setSalary(0);

        hourlyEmployee.setName("Chuck Norris");
        hourlyEmployee.setAfm("0");
        hourlyEmployee.setHourlyPayment(1000);
        hourlyEmployee.setHoursWorked(1);

        for (Employee employee : employees) {
            System.out.println(employee.payment());
        }

    }
}
