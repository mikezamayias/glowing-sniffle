package com.company.task_3;

public class UsbStick extends Product implements StorageDevice{
    private int capacity;
    private int transferRate;
    private String tradeName;

    public UsbStick() {
        super(id, name, image, price);
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public int getTransferRate() {
        return transferRate;
    }

    public void setTransferRate(int transferRate) {
        this.transferRate = transferRate;
    }

    public String getTradeName() {
        return tradeName;
    }

    public void setTradeName(String tradeName) {
        this.tradeName = tradeName;
    }

    @Override
    public void printInfo() {
        System.out.println("USB");
        System.out.printf(" |\tName\t\t\t%s\n", this.name);
        System.out.printf(" |\tCapacity\t\t%d\n", this.capacity);
        System.out.printf(" |\tTransfer rate\t%d\n", this.transferRate);
    }
}
