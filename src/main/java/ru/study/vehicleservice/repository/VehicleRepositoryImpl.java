package ru.study.vehicleservice.repository;

import java.util.List;
import org.jooq.DSLContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import ru.study.vehicleservice.dto.Vehicle;
import ru.study.vehicleservice.jooq.Tables;

@Repository
public class VehicleRepositoryImpl implements VehicleRepository {

  @Autowired DSLContext context;

  @Override
  public List<Vehicle> getAllVehicles() {
    return context.selectFrom(Tables.VEHICLES).fetchInto(Vehicle.class);
  }
}
