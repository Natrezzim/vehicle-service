package ru.study.vehicleservice.service;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.mockito.Mockito.when;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import ru.study.vehicleservice.dto.Vehicle;
import ru.study.vehicleservice.repository.VehicleRepositoryImpl;

public class VehicleServiceImplTest {

  @InjectMocks
  VehicleRepositoryImpl vehicleRepository;
  @Mock
  VehicleServiceImpl vehicleService;

  @BeforeEach
  public void setup() {
    MockitoAnnotations.openMocks(this);
  }

  @Test
  void getAllVehicles() {
    Vehicle vehicle = new Vehicle("1", "2", 2, UUID.randomUUID(), 1L, 1, 1);
    List<Vehicle> list = new ArrayList<>();
    list.add(vehicle);

    when(vehicleService.getAllVehicles()).thenReturn(list);

    //test

    assertFalse(vehicleService.getAllVehicles().isEmpty());
  }
}