package ru.study.vehicleservice.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import ru.study.vehicleservice.dto.Vehicle;
import ru.study.vehicleservice.service.VehicleService;
import java.util.List;


@RestController
public class VehiclesController {

   @Autowired
   VehicleService vehicleService;

    @RequestMapping(value = "/vehicles/list", method = RequestMethod.GET)
    public List<Vehicle> getAll(){
        return vehicleService.getAll();
    }

}