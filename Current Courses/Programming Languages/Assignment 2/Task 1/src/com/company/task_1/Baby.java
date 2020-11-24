package com.company.task_1;

public class Baby implements CryingObject {
    // override interface cry
    @Override
    public void cry() {
        System.out.println("Crying all night long!");
    }
}
