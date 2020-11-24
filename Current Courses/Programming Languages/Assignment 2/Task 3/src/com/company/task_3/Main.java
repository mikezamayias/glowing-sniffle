package com.company.task_3;

public class Main {

    public static void main(String[] args) {
        // create instances of TV and UsbStick
        TV tv = new TV();
        UsbStick usb = new UsbStick();
        // set values to tv attributes
        tv.setId(0);
        tv.setName("Samsung".toUpperCase());
        tv.setImage("TV description");
        tv.setPrice(999);
        tv.setInches(75);
        tv.setColor("Black");
        tv.setTradeName("TV model");
        // set values to usb attributes
        usb.setId(1);
        usb.setName("SanDisk");
        usb.setImage("USB description");
        usb.setPrice(8);
        usb.setCapacity(16);
        usb.setTransferRate(100);
        usb.setTradeName("USB model");
        // get and print tv attribute values
        System.out.printf("tv.getId() = %d%n", tv.getId());
        System.out.printf("tv.getName() = %s%n", tv.getName());
        System.out.printf("tv.getImage() = %s%n", tv.getImage());
        System.out.printf("tv.getPrice() = %d%n", tv.getPrice());
        System.out.printf("tv.getInches() = %d%n", tv.getInches());
        System.out.printf("tv.getColor() = %s%n", tv.getColor());
        System.out.printf("tv.getTrade_name() = %s%n", tv.getTrade_name());
        // get and print usb attribute values
        System.out.printf("usb.getId() = %d%n", usb.getId());
        System.out.printf("usb.getName() = %s%n", usb.getName());
        System.out.printf("usb.getImage() = %s%n", usb.getImage());
        System.out.printf("usb.getPrice() = %d%n", usb.getPrice());
        System.out.printf("usb.getCapacity() = %d%n", usb.getCapacity());
        System.out.printf("usb.getTransferRate() = %d%n", usb.getTransferRate());
        System.out.printf("usb.getTradeName() = %s%n", usb.getTradeName());
        // run interface of usb
        usb.printInfo();
    }
}
