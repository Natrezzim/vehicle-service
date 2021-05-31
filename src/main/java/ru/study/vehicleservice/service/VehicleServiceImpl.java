package ru.study.vehicleservice.service;

import java.util.List;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.study.vehicleservice.dto.Vehicle;
import ru.study.vehicleservice.repository.VehicleRepository;
import ru.study.vehicleservice.service.utility.ConverterService;

@Service
public class VehicleServiceImpl implements VehicleService {

  @Autowired
  VehicleRepository vehicleRepository;

  @Autowired
  ConverterService converterService;

  @Override
  public List<Vehicle> getAllVehicles() {
    return vehicleRepository.findAllVehicles()
        .stream()
        .map(pojo -> converterService.convert(pojo))
        .collect(Collectors.toList());
  }
}
