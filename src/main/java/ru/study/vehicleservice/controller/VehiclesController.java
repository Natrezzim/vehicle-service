package ru.study.vehicleservice.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import ru.study.vehicleservice.dto.Vehicle;
import ru.study.vehicleservice.service.VehicleService;
import java.util.List;


@RestController
@RequestMapping(value = "/vehicles")
public class VehiclesController {
    private VehicleService vehicleService;

    @Autowired
    public void setVehicleService(VehicleService vehicleService){
           this.vehicleService = vehicleService;
    }

    @RequestMapping("/list")
    @GetMapping
    public List<Vehicle> getAll(){
        return vehicleService.getAll();
    }

}