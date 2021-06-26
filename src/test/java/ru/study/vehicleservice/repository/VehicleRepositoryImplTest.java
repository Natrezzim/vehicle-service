package ru.study.vehicleservice.repository;

import static org.jooq.SQLDialect.POSTGRES;
import static ru.study.vehicleservice.jooq.tables.Vehicles.VEHICLES;

import java.sql.SQLException;
import java.time.OffsetDateTime;
import java.util.List;
import java.util.UUID;
import org.jooq.DSLContext;
import org.jooq.Result;
import org.jooq.impl.DSL;
import org.jooq.tools.jdbc.MockConnection;
import org.jooq.tools.jdbc.MockDataProvider;
import org.jooq.tools.jdbc.MockExecuteContext;
import org.jooq.tools.jdbc.MockResult;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import ru.study.vehicleservice.jooq.Tables;
import ru.study.vehicleservice.jooq.tables.pojos.Vehicles;
import ru.study.vehicleservice.jooq.tables.records.VehiclesRecord;

@SpringBootTest
class VehicleRepositoryImplTest {

  @Test
  void shouldFindAllVehicles() {
    MockConnection connection = new MockConnection(new AllVehiclesMockDataProvider());
    DSLContext context = DSL.using(connection, POSTGRES);
    List<Vehicles> vehicles = new VehicleRepositoryImpl(context).findAllVehicles();
  }

  static class AllVehiclesMockDataProvider implements MockDataProvider {

    @Override
    public MockResult[] execute(MockExecuteContext ctx) throws SQLException {
      UUID uuid = UUID.randomUUID();
      OffsetDateTime offsetDateTime = OffsetDateTime.now();

      DSLContext context = DSL.using(POSTGRES);

      Result<VehiclesRecord> recordResult = context.newResult(VEHICLES);

      recordResult.add(
          context
              .newRecord(Tables.VEHICLES)
              .value1(1L)
              .value2("C143FL")
              .value3("166")
              .value4(uuid)
              .value5(3)
              .value6(108)
              .value7(1)
              .value8(true)
              .value9(offsetDateTime));

      return new MockResult[] {(new MockResult(1, recordResult))};
    }
  }
}
