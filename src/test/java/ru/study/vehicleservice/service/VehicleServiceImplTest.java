package ru.study.vehicleservice.service;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.when;

import java.time.OffsetDateTime;
import java.util.List;
import java.util.UUID;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.springframework.boot.test.context.SpringBootTest;
import ru.study.vehicleservice.dto.Vehicle;
import ru.study.vehicleservice.jooq.tables.pojos.Vehicles;
import ru.study.vehicleservice.repository.VehicleRepositoryImpl;
import ru.study.vehicleservice.service.utility.ConverterService;

@SpringBootTest
public class VehicleServiceImplTest {

  @Mock
  VehicleRepositoryImpl vehicleRepository;
  @Mock
  ConverterService converterService;

  @InjectMocks
  VehicleServiceImpl vehicleService;

  @Test
  void shouldGetAllVehicles() {

    Vehicles vehicles = new Vehicles(1L, "grnz", "grnz_country_code", UUID.randomUUID(), 1, 1, 1,
        true, OffsetDateTime.now());

    List<Vehicles> vehiclesList = List.of(vehicles);

    Vehicle vehicle = new Vehicle("grnz", "grnz_country_code", 1, UUID.randomUUID(), 1L, 1, 1);

    List<Vehicle> vehicleList = List.of(vehicle);

    when(vehicleRepository.findAllVehicles()).thenReturn(vehiclesList);
    when(converterService.convert(vehicles)).thenReturn(vehicle);

    assertEquals(vehicleList, vehicleService.findAllVehicles());


  }
}