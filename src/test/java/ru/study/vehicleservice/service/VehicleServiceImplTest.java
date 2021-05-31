package ru.study.vehicleservice.service;

import static org.mockito.Mockito.when;

import java.util.List;
import java.util.UUID;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import ru.study.vehicleservice.dto.Vehicle;
import ru.study.vehicleservice.jooq.tables.pojos.Vehicles;
import ru.study.vehicleservice.repository.VehicleRepositoryImpl;
import ru.study.vehicleservice.service.utility.ConverterService;

public class VehicleServiceImplTest {

  @Mock // Мокаем репозиторий
  VehicleRepositoryImpl vehicleRepository;

  @BeforeEach
  public void initMocks() {
    MockitoAnnotations.openMocks(this);
  }

  @Test
  void shouldGetAllVehicles() {
    // Тестируемый класс, куда внедряются наши моки. Репа замоканная, конвертер сервис нет
    VehicleServiceImpl service = new VehicleServiceImpl(vehicleRepository, new ConverterService());

    UUID uuid = UUID.randomUUID();

    // Pojo из БД
    Vehicles vehiclePojo = new Vehicles(1L, "grnz", "grnz_country_code", uuid, 1, 1, 2, true, null);
    List<Vehicles> vehiclePojoList = List.of(vehiclePojo);

    // DTO, которое мы ожидаем от работы сервиса
    Vehicle vehicle = new Vehicle("grnz", "grnz_country_code", 2, uuid, 1L, 1, 1);
    List<Vehicle> expected = List.of(vehicle);

    // Мокаем результат работы БД и конвертер сервиса
    when(vehicleRepository.findAllVehicles()).thenReturn(vehiclePojoList);

    // Получили результат работы сервиса
    List<Vehicle> result = service.getAllVehicles();

    // чисто для тебя посмотреть что у нас в листе
    result.forEach(System.out::println);

    // Сравниваем ожидаемое значение с результатом работы
    Assertions.assertEquals(expected, result);
  }
}