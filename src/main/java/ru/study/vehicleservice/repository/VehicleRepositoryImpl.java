package ru.study.vehicleservice.repository;

import java.util.List;
import org.jooq.DSLContext;
import org.springframework.stereotype.Repository;
import ru.study.vehicleservice.jooq.Tables;
import ru.study.vehicleservice.jooq.tables.pojos.Vehicles;

@Repository
public class VehicleRepositoryImpl implements VehicleRepository {
  DSLContext context;

  public VehicleRepositoryImpl(DSLContext context) {
    this.context = context;
  }

  @Override
  public List<Vehicles> findAllVehicles() {
    return context.selectFrom(Tables.VEHICLES).fetchInto(Vehicles.class);
  }
}
