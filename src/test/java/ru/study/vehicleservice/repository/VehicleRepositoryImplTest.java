package ru.study.vehicleservice.repository;

import static org.jooq.SQLDialect.POSTGRES;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.when;

import java.time.OffsetDateTime;
import java.util.List;
import java.util.UUID;
import org.jooq.DSLContext;
import org.jooq.Result;
import org.jooq.impl.DSL;
import org.jooq.tools.jdbc.MockConnection;
import org.jooq.tools.jdbc.MockDataProvider;
import org.jooq.tools.jdbc.MockResult;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.springframework.boot.test.context.SpringBootTest;
import ru.study.vehicleservice.jooq.Tables;
import ru.study.vehicleservice.jooq.tables.pojos.Vehicles;
import ru.study.vehicleservice.jooq.tables.records.VehiclesRecord;

@SpringBootTest
class VehicleRepositoryImplTest {

  UUID uuid = UUID.randomUUID();
  OffsetDateTime offsetDateTime = OffsetDateTime.now();

  final MockDataProvider myMockProvider = context -> {
    final DSLContext context1 = DSL.using(POSTGRES);
    final Result<VehiclesRecord> resultRecord = context1.newResult(Tables.VEHICLES);

    resultRecord.add(
        context1.newRecord(Tables.VEHICLES).value1(1L).value2("C143FL").value3("166").value4(uuid)
            .value5(3).value6(108).value7(1).value8(true).value9(offsetDateTime));

    return new MockResult[]{new MockResult(1, resultRecord)};
  };

  final DSLContext mockedDsl = DSL.using(new MockConnection(myMockProvider), POSTGRES);

  @InjectMocks
  VehicleRepositoryImpl vehicleRepository;

  @Mock
  DSLContext context;

  @Test
  void findAllVehicles() {

    when(context.selectFrom(Tables.VEHICLES))
        .thenReturn(mockedDsl.selectFrom(Tables.VEHICLES));

    List<Vehicles> mockVehicles = mockedDsl.selectFrom(Tables.VEHICLES).fetchInto(Vehicles.class);

    List<Vehicles> resultVehicles = vehicleRepository.findAllVehicles();

    assertEquals(mockedDsl.selectFrom(Tables.VEHICLES).fetchInto(Vehicles.class),
        vehicleRepository.findAllVehicles());


  }
}