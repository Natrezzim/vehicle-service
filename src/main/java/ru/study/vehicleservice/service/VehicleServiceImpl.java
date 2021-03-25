package ru.study.vehicleservice.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import ru.study.vehicleservice.controller.VehiclesController;
import ru.study.vehicleservice.dto.Vehicle;
import ru.study.vehicleservice.repository.VehicleRepository;

import java.util.List;


@Service
public class VehicleServiceImpl implements VehicleService {


    @Autowired
    VehicleRepository vehicleRepository;


    @Override
    public List<Vehicle> getAll() {
        return vehicleRepository.getAll();
    }

}
