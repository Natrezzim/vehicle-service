package ru.study.vehicleservice.repository;


import org.springframework.stereotype.Repository;
import ru.study.vehicleservice.dto.Vehicle;
import javax.annotation.PostConstruct;
import java.util.*;
import java.util.List;

@Repository
public class VehicleRepositoryImpl implements VehicleRepository {

    private static final List<Vehicle> vehList = new ArrayList<Vehicle>();

    @PostConstruct
    private static void initVehs() {
        Vehicle vhc1 = new Vehicle("А100АА150","RUS",2, UUID.randomUUID(),38,"active","2",22,143);
        Vehicle vhc2 = new Vehicle("С1343АС152","RUS",3, UUID.randomUUID(),4234,"active","3",46675,3453);
        Vehicle vhc3 = new Vehicle("А453А14350","RUS",2, UUID.randomUUID(),42424,"active","5",7575,75757);

        vehList.add(vhc1);
        vehList.add(vhc2);
        vehList.add(vhc3);
    }

    public List<Vehicle> getAll() {
        List list = vehList;
        return list;
    }








}
