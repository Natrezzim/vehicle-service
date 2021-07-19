package ru.study.vehicleservice.service;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.when;

import java.time.OffsetDateTime;
import java.util.List;
import java.util.UUID;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import ru.study.vehicleservice.dto.Vehicle;
import ru.study.vehicleservice.jooq.tables.pojos.Vehicles;
import ru.study.vehicleservice.repository.VehicleRepositoryImpl;
import ru.study.vehicleservice.service.utility.ConverterService;

@SpringBootTest
public class VehicleServiceImplTest {

  @Autowired
  VehicleServiceImpl vehicleService;
  @Autowired
  ConverterService converterService;
  @MockBean
  VehicleRepositoryImpl vehicleRepository;

  @Test
  void shouldGetAllVehicles() {

    UUID uuid = UUID.randomUUID();

    OffsetDateTime offsetDateTime = OffsetDateTime.now();

    Vehicles vehicles = new Vehicles(1L, "C143FL", "166", uuid, 3, 108, 1,
        true, offsetDateTime);

    List<Vehicles> vehiclesList = List.of(vehicles);

    when(vehicleRepository.findAllVehicles()).thenReturn(vehiclesList);

    Vehicle vehicle = new Vehicle("C143FL", "166", 1, uuid, 1L, 3, 108);

    List<Vehicle> vehicleList = List.of(vehicle);

    assertEquals(vehicleList, vehicleService.findAllVehicles());

  }
}