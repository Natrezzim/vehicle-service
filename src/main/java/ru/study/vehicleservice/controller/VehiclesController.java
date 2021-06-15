package ru.study.vehicleservice.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.study.vehicleservice.dto.Vehicle;
import ru.study.vehicleservice.service.VehicleService;
import ru.study.vehicleservice.service.VehicleServiceImpl;

@RestController
@RequestMapping(value = "/vehicles")
public class VehiclesController {

  private final VehicleServiceImpl vehicleService;

  public VehiclesController(VehicleServiceImpl vehicleService) {
    this.vehicleService = vehicleService;
  }

  @GetMapping
  public List<Vehicle> findAllVehicles() {
    return vehicleService.findAllVehicles();
  }
}
