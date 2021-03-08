package ru.study.vehicleservice.controller;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.*;
import ru.study.vehicleservice.dto.Vehicle;
import ru.study.vehicleservice.repository.VedicleDTO;

import java.util.List;


@RestController
@RequestMapping("/vehicles")
public class VehiclesController {

@Autowired
    VedicleDTO vedicleDTO;



@RequestMapping(method = RequestMethod.GET)


    public List<Vehicle> getVehicles(){
    List<Vehicle> list = vedicleDTO.getAllVehicles();
    return list;
}


    



}