package com.company.task_3;

public class UsbStick extends Product implements StorageDevice{
    // usb stick attributes
    private int capacity;
    private int transferRate;
    private String tradeName;
    // usb stick constructor
    public UsbStick() {
        super(id, name, image, price);
    }
    // getter of usb stick
    public int getCapacity() {
        return capacity;
    }
    // getter of usb stick
    public int getTransferRate() {
        return transferRate;
    }
    // getter of usb stick
    public String getTradeName() {
        return tradeName;
    }
    // setter of usb stick
    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }
    // setter of usb stick
    public void setTransferRate(int transferRate) {
        this.transferRate = transferRate;
    }
    // setter of usb stick
    public void setTradeName(String tradeName) {
        this.tradeName = tradeName;
    }
    // method of usb stick
    @Override
    public void printInfo() {
        System.out.println("USB");
        System.out.printf(" |\tName\t\t\t%s\n", this.name);
        System.out.printf(" |\tCapacity\t\t%d\n", this.capacity);
        System.out.printf(" |\tTransfer rate\t%d\n", this.transferRate);
    }
}
