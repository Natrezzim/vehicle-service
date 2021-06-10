package ru.study.vehicleservice.controller;


import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.util.List;
import java.util.UUID;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.json.AutoConfigureJsonTesters;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.test.web.servlet.MockMvc;
import ru.study.vehicleservice.dto.Vehicle;
import ru.study.vehicleservice.service.VehicleServiceImpl;

@AutoConfigureJsonTesters
@SpringBootTest
@AutoConfigureMockMvc
class VehiclesControllerTest {


  @Mock
  VehicleServiceImpl vehicleService;
  @InjectMocks
  VehiclesController vehiclesController;
  @Autowired
  private MockMvc mvc;

  @Test
  void shouldFindAllVehicles() throws Exception {

    Vehicle vehicle = new Vehicle("grnz", "grnz_country_code", 1, UUID.randomUUID(), 1L, 1, 1);

    List<Vehicle> vehicleList = List.of(vehicle);

    MockHttpServletResponse response = mvc.perform(
        get("/vehicles")
            .accept(MediaType.APPLICATION_JSON))
        .andReturn().getResponse();

    mvc.perform(
        get("/vehicles")
            .contentType(MediaType.APPLICATION_JSON))
        .andExpect(status().isOk())
        .andExpect(content().contentTypeCompatibleWith(MediaType.APPLICATION_JSON));

    when(vehicleService.findAllVehicles()).thenReturn(vehicleList);

    assertThat(response.getStatus()).isEqualTo(HttpStatus.OK.value());
    assertEquals(vehicleList, vehiclesController.findAllVehicles());

  }

}