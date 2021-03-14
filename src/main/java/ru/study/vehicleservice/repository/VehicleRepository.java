package ru.study.vehicleservice.repository;


import ru.study.vehicleservice.dto.Vehicle;

import java.util.List;

public interface VehicleRepository {

    List<Vehicle> getAll();
}
