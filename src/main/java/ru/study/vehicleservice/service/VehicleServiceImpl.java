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

  VehicleRepository vehicleRepository;
  ConverterService converterService;

  @Autowired
  public VehicleServiceImpl(
      VehicleRepository vehicleRepository,
      ConverterService converterService
  ) {
    this.vehicleRepository = vehicleRepository;
    this.converterService = converterService;
  }

  @Override
  public List<Vehicle> findAllVehicles() {
    return vehicleRepository.findAllVehicles()
        .stream()
        .map(pojo -> converterService.convert(pojo))
        .collect(Collectors.toList());
  }
}
