package ru.study.vehicleservice.repository;

import java.util.List;
import ru.study.vehicleservice.jooq.tables.pojos.Vehicles;

public interface VehicleRepository {

  List<Vehicles> findAllVehicles();
}
