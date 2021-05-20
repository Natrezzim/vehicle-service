package ru.study.vehicleservice.dto;

import java.util.UUID;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@FieldDefaults(level = AccessLevel.PRIVATE)
public class Vehicle {

  String grnz;
  String grnzCountryCode;
  Integer vehicleClassId;
  UUID vehicleUuid;
  Long id;
  Integer brandId;
  Integer modelId;

  public Vehicle(
      String grnz,
      String grnzCountryCode,
      Integer vehicleClassId,
      UUID vehicleUuid,
      Long id,
      Integer brandId,
      Integer modelId) {
    this.grnz = grnz;
    this.grnzCountryCode = grnzCountryCode;
    this.vehicleClassId = vehicleClassId;
    this.vehicleUuid = vehicleUuid;
    this.id = id;
    this.brandId = brandId;
    this.modelId = modelId;
  }
}
