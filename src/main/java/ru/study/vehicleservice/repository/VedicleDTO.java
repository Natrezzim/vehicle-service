package ru.study.vehicleservice.repository;

import org.springframework.beans.factory.annotation.Autowired;
import ru.study.vehicleservice.dto.Vehicle;

import java.awt.*;
import java.util.*;
import java.util.List;

public class VedicleDTO {

    private static final Map<Integer, Vehicle> vehMap = new HashMap<Integer, Vehicle>();

    static {
        initVehs();
    }

    private static void initVehs() {
        Vehicle vhc1 = new Vehicle("А100АА150","RUS",2, UUID.randomUUID(),38,"active","2",22,143);
        Vehicle vhc2 = new Vehicle("С1343АС152","RUS",3, UUID.randomUUID(),4234,"active","3",46675,3453);
        Vehicle vhc3 = new Vehicle("А453А14350","RUS",2, UUID.randomUUID(),42424,"active","5",7575,75757);

        vehMap.put(1, vhc1);
        vehMap.put(2, vhc2);
        vehMap.put(3, vhc3);

    }

    public Vehicle getVehicle(Integer vhcNO){
        return vehMap.get(vhcNO);
    }


    public List<Vehicle> getAllVehicles(){
        Collection<Vehicle> c = vehMap.values();
        List<Vehicle> list = new ArrayList<Vehicle>();
        list.addAll(c);
        return list;
    }

}
