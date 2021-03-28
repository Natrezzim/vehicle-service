package ru.study.vehicleservice.dto;

import java.util.UUID;

public class Vehicle {


  private String grnz;
  private String grnzCountryCode;
  private Integer vehicleClassID;
  private UUID vehicleUUID;
  private Integer id;
  private String status;
  private String vehicleClassCode;
  private Integer brandID;
  private Integer modelID;


  public Vehicle(String grnz, String grnzCountryCode, Integer vehicleClassID, UUID vehicleUUID,
      Integer id, String status, String vehicleClassCode, Integer brandID, Integer modelID) {
    this.grnz = grnz;
    this.grnzCountryCode = grnzCountryCode;
    this.vehicleClassID = vehicleClassID;
    this.vehicleUUID = vehicleUUID;
    this.id = id;
    this.status = status;
    this.vehicleClassCode = vehicleClassCode;
    this.brandID = brandID;
    this.modelID = modelID;
  }

  public String getGrnz() {
    return grnz;
  }

  public void setGrnz(String grnz) {
    this.grnz = grnz;
  }

  public String getGrnzCountryCode() {
    return grnzCountryCode;
  }

  public void setGrnzCountryCode(String grnzCountryCode) {
    this.grnzCountryCode = grnzCountryCode;
  }

  public Integer getVehicleClassID() {
    return vehicleClassID;
  }

  public void setVehicleClassID(Integer vehicleClassID) {
    this.vehicleClassID = vehicleClassID;
  }

  public UUID getVehicleUUID() {
    return vehicleUUID;
  }

  public void setVehicleUUID(UUID vehicleUUID) {
    this.vehicleUUID = UUID.randomUUID();
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

  public String getVehicleClassCode() {
    return vehicleClassCode;
  }

  public void setVehicleClassCode(String vehicleClassCode) {
    this.vehicleClassCode = vehicleClassCode;
  }

  public Integer getBrandID() {
    return brandID;
  }

  public void setBrandID(Integer brandID) {
    this.brandID = brandID;
  }

  public Integer getModelID() {
    return modelID;
  }

  public void setModelID(Integer modelID) {
    this.modelID = modelID;
  }
}