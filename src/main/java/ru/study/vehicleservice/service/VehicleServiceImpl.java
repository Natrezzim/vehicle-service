package ru.study.vehicleservice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.study.vehicleservice.dto.Vehicle;
import ru.study.vehicleservice.repository.VehicleRepository;
import java.util.List;


@Service
public class VehicleServiceImpl implements VehicleService {

    @Autowired
    VehicleRepository vehicleRepository;



    @Override
    public List<Vehicle> getAll(){
        return vehicleRepository.getAll();
    }

}
