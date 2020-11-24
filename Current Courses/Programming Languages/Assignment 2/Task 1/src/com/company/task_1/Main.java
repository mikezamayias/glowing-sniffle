// TODO: comment Main
package com.company.task_1;

public class Main {

    public static void main(String[] args) {
        CryingObject[] arrayOfCries = new CryingObject[2];

        Baby baby = new Baby();
        BluesSinger bluesSinger = new BluesSinger();

        arrayOfCries[0] = baby;
        arrayOfCries[1] = bluesSinger;

        for (CryingObject cryingObject : arrayOfCries) {
            cryingObject.cry();
        }

    }
}
