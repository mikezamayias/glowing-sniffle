// TODO: comment Employee
package com.company.task_2;

public abstract class Employee {
    protected static String name;
    protected static String afm;

    public Employee(String name, String afm) {
        Employee.name = name;
        Employee.afm = afm;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        Employee.name = name;
    }

    public String getAfm() {
        return afm;
    }

    public void setAfm(String afm) {
        Employee.afm = afm;
    }

    public int payment() {
        return -1;
    }
}
