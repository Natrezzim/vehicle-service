package ru.study.vehicleservice.repository;

import java.util.List;
import org.jooq.DSLContext;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;
import ru.study.vehicleservice.config.JooqConfig;
import ru.study.vehicleservice.jooq.tables.pojos.Vehicles;

@SpringBootTest
@ContextConfiguration(classes = JooqConfig.class)
public class VehicleRepositoryTest {

  @Autowired
  VehicleRepository vehicleRepository;

  @Autowired
  DSLContext context;

  @Test
  void shouldFindAllVehicles() {
    List<Vehicles> vehicles = vehicleRepository.findAllVehicles();

    System.out.println(vehicles);
  }
}
