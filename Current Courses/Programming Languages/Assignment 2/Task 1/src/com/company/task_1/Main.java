package com.company.task_1;

public class Main {

    public static void main(String[] args) {
        // an array of crying objects
        CryingObject[] arrayOfCries = new CryingObject[2];
        // create instances of Baby and BluesSiner
        Baby baby = new Baby();
        BluesSinger bluesSinger = new BluesSinger();
        //  set above instances to "array of cries"
        arrayOfCries[0] = baby;
        arrayOfCries[1] = bluesSinger;
        // cry for every object
        for (CryingObject cryingObject : arrayOfCries) {
            cryingObject.cry();
        }

    }
}
