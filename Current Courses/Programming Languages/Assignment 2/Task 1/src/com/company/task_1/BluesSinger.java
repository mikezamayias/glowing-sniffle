package com.company.task_1;

public class BluesSinger implements CryingObject{
    // override interface cry
    @Override
    public void cry() {
        System.out.println("Crying when singing!");
    }
}
