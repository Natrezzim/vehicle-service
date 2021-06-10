package ru.study.vehicleservice.config;

import static org.jooq.SQLDialect.*;
import static org.jooq.impl.DSL.*;
import java.sql.*;
import javax.sql.*;
import org.jooq.*;
import org.jooq.Record;
import ru.study.vehicleservice.jooq.tables.*;
import org.jooq.impl.*;
import org.jooq.tools.jdbc.MockDataProvider;
import org.jooq.tools.jdbc.MockExecuteContext;
import org.jooq.tools.jdbc.MockResult;

// The "create" reference is an instance of DSLContext

public class MyProvider implements MockDataProvider {

  @Override
  public MockResult[] execute(MockExecuteContext ctx) throws SQLException {

    // You might need a DSLContext to create org.jooq.Result and org.jooq.Record objects
    DSLContext create = DSL.using(HSQLDB);
    MockResult[] mock = new MockResult[1];

    // The execute context contains SQL string(s), bind values, and other meta-data
    String sql = ctx.sql();

    // Exceptions are propagated through the JDBC and jOOQ APIs
    if (sql.toUpperCase().startsWith("DROP")) {
      throw new SQLException("Statement not supported: " + sql);
    }

    // You decide, whether any given statement returns results, and how many
    else if (sql.toUpperCase().startsWith("SELECT")) {

      // Always return one record
      Result<Record2<Long, String>> result = create.newResult(Vehicles.VEHICLES.ID, Vehicles.VEHICLES.GRNZ);
      result.add(create
          .newRecord(Vehicles.VEHICLES.ID, Vehicles.VEHICLES.GRNZ)
          .values(1L,"123"));
      mock[0] = new MockResult(1, result);
    }

    return mock;
  }
}