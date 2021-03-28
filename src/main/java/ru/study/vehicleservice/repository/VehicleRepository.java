package ru.study.vehicleservice.repository;


import java.util.List;
import ru.study.vehicleservice.dto.Vehicle;

public interface VehicleRepository {

  List<Vehicle> getAll();
}
