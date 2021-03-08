package ru.study.vehicleservice.dto;

import java.util.UUID;

public class Vehicle {
    private String grnz;
    private String grnz_country_code;
    private Integer vehicle_class_id;
    private UUID vehicle_uuid;
    private Integer id;
    private String status;
    private String vehicle_class_code;
    private Integer brand_id;
    private Integer model_id;

    public Vehicle(){

    }

    public Vehicle(String grnz, String grnz_country_code, Integer vehicle_class_id, UUID vehicle_uuid, Integer id, String status, String vehicle_class_code, Integer brand_id, Integer model_id) {
        this.grnz = grnz;
        this.grnz_country_code = grnz_country_code;
        this.vehicle_class_id = vehicle_class_id;
        this.vehicle_uuid = vehicle_uuid;
        this.id = id;
        this.status = status;
        this.vehicle_class_code = vehicle_class_code;
        this.brand_id = brand_id;
        this.model_id = model_id;
    }


    public String getGrnz() {
        return grnz;
    }

    public void setGrnz(String grnz) {
        this.grnz = grnz;
    }

    public String getGrnz_country_code() {
        return grnz_country_code;
    }

    public void setGrnz_country_code(String grnz_country_code) {
        this.grnz_country_code = grnz_country_code;
    }

    public Integer getVehicle_class_id() {
        return vehicle_class_id;
    }

    public void setVehicle_class_id(Integer vehicle_class_id) {
        this.vehicle_class_id = vehicle_class_id;
    }

    public UUID getVehicle_uuid() {
        return vehicle_uuid;
    }

    public void setVehicle_uuid(UUID vehicle_uuid) {
        this.vehicle_uuid = UUID.randomUUID();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getVehicle_class_code() {
        return vehicle_class_code;
    }

    public void setVehicle_class_code(String vehicle_class_code) {
        this.vehicle_class_code = vehicle_class_code;
    }

    public Integer getBrand_id() {
        return brand_id;
    }

    public void setBrand_id(Integer brand_id) {
        this.brand_id = brand_id;
    }

    public Integer getModel_id() {
        return model_id;
    }

    public void setModel_id(Integer model_id) {
        this.model_id = model_id;
    }



}
