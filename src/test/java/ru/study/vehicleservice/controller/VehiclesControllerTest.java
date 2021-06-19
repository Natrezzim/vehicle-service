package ru.study.vehicleservice.controller;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.util.List;
import java.util.UUID;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.test.web.servlet.MockMvc;
import ru.study.vehicleservice.dto.Vehicle;
import ru.study.vehicleservice.service.VehicleServiceImpl;

@WebMvcTest(VehiclesController.class)
class VehiclesControllerTest {

  @MockBean
  VehicleServiceImpl vehicleService;
  @Autowired
  private MockMvc mvc;

  @Test
  void shouldFindAllVehicles() throws Exception {

    UUID uuid = UUID.randomUUID();

    Vehicle vehicle = new Vehicle("C143FL", "166", 1, uuid, 1L, 3, 108);

    List<Vehicle> vehicleList = List.of(vehicle);
    when(vehicleService.findAllVehicles()).thenReturn(vehicleList);

    MockHttpServletResponse response = mvc.perform(
        get("/vehicles")
            .accept(MediaType.APPLICATION_JSON))
        .andReturn().getResponse();

    mvc.perform(
        get("/vehicles")
            .contentType(MediaType.APPLICATION_JSON))
        .andExpect(status().isOk())
        .andExpect(content().contentTypeCompatibleWith(MediaType.APPLICATION_JSON));

    System.out.println(response.getContentAsString());

    assertThat(response.getStatus()).isEqualTo(HttpStatus.OK.value());
  }
}