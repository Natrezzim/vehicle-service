package ru.study.vehicleservice.repository;

import static org.assertj.core.api.Assertions.assertThat;
import static org.jooq.SQLDialect.POSTGRES;
import static ru.study.vehicleservice.jooq.tables.Vehicles.VEHICLES;

import java.time.OffsetDateTime;
import java.util.List;
import java.util.UUID;
import org.jooq.DSLContext;
import org.jooq.Result;
import org.jooq.impl.DSL;
import org.jooq.tools.jdbc.MockConnection;
import org.jooq.tools.jdbc.MockResult;
import org.junit.jupiter.api.Test;
import ru.study.vehicleservice.jooq.Tables;
import ru.study.vehicleservice.jooq.tables.pojos.Vehicles;
import ru.study.vehicleservice.jooq.tables.records.VehiclesRecord;

class VehicleRepositoryImplTest {

  @Test
  void shouldFindAllVehicles() {

    MockConnection connection =
        new MockConnection(
            ctx -> {
              DSLContext context = DSL.using(POSTGRES);
              Result<VehiclesRecord> recordResult = context.newResult(VEHICLES);
              recordResult.add(
                  context
                      .newRecord(Tables.VEHICLES)
                      .value1(1L)
                      .value2("C143FL")
                      .value3("166")
                      .value4(UUID.randomUUID())
                      .value5(3)
                      .value6(108)
                      .value7(1)
                      .value8(true)
                      .value9(OffsetDateTime.now()));
              return new MockResult[] {(new MockResult(1, recordResult))};
            });

    UUID uuid = UUID.randomUUID();
    OffsetDateTime offsetDateTime = OffsetDateTime.now();

    DSLContext context = DSL.using(connection, POSTGRES);
    List<Vehicles> vehicles = new VehicleRepositoryImpl(context).findAllVehicles();
    List<Vehicles> expectedVehicles =
        List.of(new Vehicles(1L, "C143FL", "166", uuid, 3, 108, 1, true, offsetDateTime));

    assertThat(vehicles)
        .usingElementComparatorIgnoringFields("vehicleUuid", "createdAt")
        .isEqualTo(expectedVehicles);
  }
}
