package ru.study.vehicleservice.repository;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import javax.annotation.PostConstruct;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import ru.study.vehicleservice.dto.Vehicle;

@Repository
public class VehicleRepositoryImpl implements VehicleRepository {

  private static final List<Vehicle> VEHICLE_LIST = new ArrayList<>();

  Logger logger = LoggerFactory.getLogger(VehicleRepositoryImpl.class);

  @PostConstruct
  private static void initVehicles() {
    Vehicle vhc1 =
        new Vehicle("А100АА150", "RUS", 2, UUID.randomUUID(), 38, "active", "2", 22, 143);
    Vehicle vhc2 =
        new Vehicle("С1343АС152", "RUS", 3, UUID.randomUUID(), 4234, "active", "3", 46675, 3453);
    Vehicle vhc3 =
        new Vehicle("А453А14350", "RUS", 2, UUID.randomUUID(), 42424, "active", "5", 7575, 75757);

    VEHICLE_LIST.add(vhc1);
    VEHICLE_LIST.add(vhc2);
    VEHICLE_LIST.add(vhc3);
  }

  @Override
  public List<Vehicle> getAll() {
    logger.info("{} row(s) has found", VEHICLE_LIST.size());
    return VEHICLE_LIST;
  }
}