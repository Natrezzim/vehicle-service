package ru.study.vehicleservice.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import org.springframework.boot.test.context.TestConfiguration;
import org.springframework.context.annotation.Bean;

@TestConfiguration
public class TestConfig {

  @Bean
  public ObjectMapper jacksonObjectMapper() {
    return new ObjectMapper().setPropertyNamingStrategy(PropertyNamingStrategy.SNAKE_CASE);
  }

}
