package ru.study.vehicleservice.dto;

import java.util.UUID;

public class Vehicle {

  private String grnz;
  private String grnzCountryCode;
  private Integer vehicleClassId;
  private UUID vehicleUuid;
  private Integer id;
  private String status;
  private String vehicleClassCode;
  private Integer brandId;
  private Integer modelId;

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

  public Integer getVehicleClassId() {
    return vehicleClassId;
  }

  public void setVehicleClassId(Integer vehicleClassId) {
    this.vehicleClassId = vehicleClassId;
  }

  public UUID getVehicleUuid() {
    return vehicleUuid = UUID.randomUUID();
  }

  public void setVehicleUuid(UUID vehicleUuid) {
    this.vehicleUuid = vehicleUuid;
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

  public Integer getBrandId() {
    return brandId;
  }

  public void setBrandId(Integer brandId) {
    this.brandId = brandId;
  }

  public Integer getModelId() {
    return modelId;
  }

  public void setModelId(Integer modelId) {
    this.modelId = modelId;
  }
}