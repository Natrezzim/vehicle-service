package ru.study.vehicleservice.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import ru.study.vehicleservice.dto.Vehicle;
import ru.study.vehicleservice.service.VehicleServiceImpl;
import java.util.List;


@RestController
@RequestMapping("/vehicles")
public class VehiclesController {

   @Autowired
   VehicleServiceImpl vehicleService;

    @RequestMapping(method = RequestMethod.GET)
    @ResponseBody
    public List<Vehicle> getAll(){
        return vehicleService.getAll();
    }

}