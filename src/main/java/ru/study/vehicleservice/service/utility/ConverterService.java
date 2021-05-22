package ru.study.vehicleservice.service.utility;

import org.springframework.stereotype.Component;
import ru.study.vehicleservice.dto.Vehicle;
import ru.study.vehicleservice.jooq.tables.pojos.Vehicles;

@Component
public class ConverterService {

  public Vehicle convert(Vehicles vehicles) {
    return new Vehicle(
        vehicles.getGrnz(),
        vehicles.getGrnzCountryCode(),
        vehicles.getVehicleClassesId(),
        vehicles.getVehicleUuid(),
        vehicles.getId(),
        vehicles.getBrandId(),
        vehicles.getModelId()
    );
  }
}
