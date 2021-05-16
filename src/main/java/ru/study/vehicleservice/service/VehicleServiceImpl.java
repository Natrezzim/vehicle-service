package ru.study.vehicleservice.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.study.vehicleservice.dto.Vehicle;
import ru.study.vehicleservice.repository.VehicleRepository;

@Service
public class VehicleServiceImpl implements VehicleService {

  @Autowired VehicleRepository vehicleRepository;

  @Override
  public List<Vehicle> getAllVehicles() {
    return vehicleRepository.getAllVehicles();
  }
}
