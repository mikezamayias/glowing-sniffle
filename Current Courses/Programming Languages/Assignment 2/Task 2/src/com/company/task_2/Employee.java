package com.company.task_2;

public abstract class Employee {
    // employee attributes
    protected static String name;
    protected static String afm;
    // employee constructor
    public Employee(String name, String afm) {
        Employee.name = name;
        Employee.afm = afm;
    }
    // getter of employee
    public String getName() {
        return name;
    }
    // getter of employee
    public String getAfm() {
        return afm;
    }
    // setter of employee
    public void setName(String name) {
        Employee.name = name;
    }
    // setter of employee
    public void setAfm(String afm) {
        Employee.afm = afm;
    }
    // method of employee
    public int payment() {
        return -1;
    }
}
