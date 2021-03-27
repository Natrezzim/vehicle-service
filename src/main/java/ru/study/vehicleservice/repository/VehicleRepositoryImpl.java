package ru.study.vehicleservice.repository;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import ru.study.vehicleservice.dto.Vehicle;

import javax.annotation.PostConstruct;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Repository
public class VehicleRepositoryImpl implements VehicleRepository {

    private static final List<Vehicle> vehList = new ArrayList<>();

    Logger logger = LoggerFactory.getLogger(VehicleRepositoryImpl.class);

    @PostConstruct
    private static void initVehicles() {
        Vehicle vhc1 = new Vehicle("А100АА150", "RUS", 2, UUID.randomUUID(), 38, "active", "2", 22, 143);
        Vehicle vhc2 = new Vehicle("С1343АС152", "RUS", 3, UUID.randomUUID(), 4234, "active", "3", 46675, 3453);
        Vehicle vhc3 = new Vehicle("А453А14350", "RUS", 2, UUID.randomUUID(), 42424, "active", "5", 7575, 75757);

        vehList.add(vhc1);
        vehList.add(vhc2);
        vehList.add(vhc3);
    }

    @Override
    public List<Vehicle> getAll() {
        logger.info("{} row(s) has found", vehList.size());
        return vehList;
    }
}