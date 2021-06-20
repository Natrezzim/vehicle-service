package ru.study.vehicleservice.config;

import static ru.study.vehicleservice.jooq.tables.Vehicles.VEHICLES;

import java.sql.SQLException;
import java.time.OffsetDateTime;
import java.util.UUID;
import org.jooq.DSLContext;
import org.jooq.Result;
import org.jooq.SQLDialect;
import org.jooq.impl.DSL;
import org.jooq.tools.jdbc.MockConnection;
import org.jooq.tools.jdbc.MockDataProvider;
import org.jooq.tools.jdbc.MockExecuteContext;
import org.jooq.tools.jdbc.MockResult;
import org.springframework.boot.test.context.TestConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Primary;
import ru.study.vehicleservice.jooq.tables.records.VehiclesRecord;

@TestConfiguration
public class JooqConfig {

  @Bean
  @Primary
  public DSLContext dslContext() {
    MockConnection connection = new MockConnection(new AllVehiclesMockDataProvider());
    return DSL.using(connection, SQLDialect.POSTGRES);
  }

  static class AllVehiclesMockDataProvider implements MockDataProvider {

    @Override
    public MockResult[] execute(MockExecuteContext ctx) throws SQLException {
      UUID uuid = UUID.randomUUID();
      OffsetDateTime nowDt = OffsetDateTime.now();

//      Определяем context
      DSLContext context = DSL.using(SQLDialect.POSTGRES);

//      Создаём пустой result
      Result<VehiclesRecord> recordResult = context.newResult(VEHICLES);

//      Наполняем result
      recordResult.add(
          context.newRecord(
              VEHICLES).value1(1L).value2("C143FL").value3("166").value4(uuid)
              .value5(3).value6(108).value7(1).value8(true).value9(nowDt)
      );

      return new MockResult[]{new MockResult(1, recordResult)};
    }
  }
}
