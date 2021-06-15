package ru.study.vehicleservice.repository;

import static org.jooq.SQLDialect.POSTGRES;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.when;

import java.sql.SQLException;
import org.jooq.DSLContext;
import org.jooq.Result;
import org.jooq.impl.DSL;
import org.jooq.tools.jdbc.MockConnection;
import org.jooq.tools.jdbc.MockDataProvider;
import org.jooq.tools.jdbc.MockExecuteContext;
import org.jooq.tools.jdbc.MockResult;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import ru.study.vehicleservice.jooq.Tables;
import ru.study.vehicleservice.jooq.tables.pojos.Vehicles;
import ru.study.vehicleservice.jooq.tables.records.VehiclesRecord;

@SpringBootTest
class VehicleRepositoryImplTest {



  final MockDataProvider myMockProvider = new MockDataProvider() {
    @Override
    public MockResult[] execute(final MockExecuteContext context) throws SQLException {
      final DSLContext context1 = DSL.using(POSTGRES);
      final Result<VehiclesRecord> resultRecord = context1.newResult(Tables.VEHICLES);

      // customize your record with needed fields

      resultRecord.add(context1.newRecord(Tables.VEHICLES));

      return new MockResult[]{new MockResult(1, resultRecord)};
    }
  };

  final DSLContext mockedDSL = DSL.using(new MockConnection(myMockProvider), POSTGRES);

  @InjectMocks
  VehicleRepositoryImpl vehicleRepository;



  @Test
  void findAllVehicles() {

    when(vehicleRepository.context.selectFrom(Tables.VEHICLES)).thenReturn(mockedDSL.selectFrom(Tables.VEHICLES));

    assertEquals(mockedDSL.selectFrom(Tables.VEHICLES).fetchInto(Vehicles.class),
        vehicleRepository.findAllVehicles());


  }
}