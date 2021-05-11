package ru.study.vehicleservice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
public class VehicleServiceApplication {

  public static void main(String[] args) {
    SpringApplication.run(VehicleServiceApplication.class, args);
  }
}
