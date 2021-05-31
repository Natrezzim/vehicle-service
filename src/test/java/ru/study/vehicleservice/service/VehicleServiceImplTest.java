package ru.study.vehicleservice.service;

import static org.mockito.Mockito.when;

import java.util.List;
import java.util.UUID;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.springframework.boot.test.context.SpringBootTest;
import ru.study.vehicleservice.dto.Vehicle;
import ru.study.vehicleservice.jooq.tables.pojos.Vehicles;
import ru.study.vehicleservice.repository.VehicleRepositoryImpl;
import ru.study.vehicleservice.service.utility.ConverterService;

@SpringBootTest
public class VehicleServiceImplTest {

  @Mock // Мокаем репозиторий
  VehicleRepositoryImpl vehicleRepository;

  @Mock // мокаем конвертер сервис
  ConverterService converterService;

  // Тестируемый класс, куда внедряются наши моки
  @InjectMocks
  VehicleServiceImpl service;

  @Test
  void shouldGetAllVehicles() {
    UUID uuid = UUID.randomUUID();

    // Pojo из БД
    Vehicles vehiclePojo = new Vehicles(1L, "grnz", "grnz_country_code", uuid, 1, 1, 2, true, null);
    List<Vehicles> vehiclePojoList = List.of(vehiclePojo);

    // DTO, которое мы ожидаем от работы сервиса
    Vehicle vehicle = new Vehicle("1", "2", 2, uuid, 1L, 1, 1);
    List<Vehicle> expected = List.of(vehicle);

    // Мокаем результат работы БД и конвертер сервиса
    when(vehicleRepository.findAllVehicles()).thenReturn(vehiclePojoList);
    when(converterService.convert(vehiclePojo)).thenReturn(vehicle);

    // Получили результат работы сервиса
    List<Vehicle> result = service.getAllVehicles();

    // Сравниваем ожидаемое значение с результатом работы
    Assertions.assertEquals(expected, result);
  }
}