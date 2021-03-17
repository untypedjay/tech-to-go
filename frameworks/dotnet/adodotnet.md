# ADO.NET
## Design
* separation of data access and data manipulation
* supporting multi-layer applications
* ADO.NET is the basis for OR mapping (Entity Framework, NHibernate)

## Data-Provider
* consists of provider independent interfaces and (abstract) classes
* interfaces: `System.Data.IDbX`
* abstract classes: `System.Data.Common.DbX`
* provider specific classes (SqlServer): `Microsoft.Data.SqlClient.SqlX`
* provider specific classes (Oracle): `Microsoft.Data.SqlClient.OracleX`
* provider specific classes (MySQL): `Microsoft.Data.SqlClient.MySqlX`

X:
* Connection
* Command
* DataAdapter
* DataParameter
* CommandBuilder
* Transaction

Components of the Data Provider:
* Connectioon
* Command
* DataReader
* DataAdapter (Select-, Insert-, Update- & DeleteCommand)

### Connections
* represents a database connection
* `ConnectionString` includes parameters for the connection
* ADO.NET supports _Connection Pooling_ by default
```csharp
using (IDbConnection conn = new SqlConnection(myConnStr)) {
  conn.Open();
  using (IDbCommand cmd = new SqlCommand(sqlQuery, conn)) {
    ...
  }
} // conn.Displose() -> conn.Close()
```

### DataReader
* iterates through data sets
```csharp
string sql = "SELECT name, age FROM Person";
IDbCommand selectCmd = new SqlCommand(sql, conn);

IDataReader reader = selectCmd.ExecuteReader();

while (reader.Read()) {
  string name = (string)reader[0];
  int age = (int)reader["age"];
}
```

### Commands
* `ExecuteNonQuery`: writing database commands (insert, update, delete), return value is number of affected data sets
```csharp
string sql = "UPDATE Person SET name='Elon'";
IDbCommand updCmd = new SqlCommand(sql, conn);
int rowsAffected = updCmd.ExecuteNonQuery();
```
* `ExecuteScalar`: commands with scalar return value (needs to be converted in correct type)
```csharp
string sql = "SELECT COUNT(*) FROM Person";
IDbCommand countCmd = new SqlCommand(sql, conn);
int noOfPersons = (int) countCmd.ExecuteScalar();
```

### Provider Independent Implementation
Configuration file:
```json
{
  "ConnectionStrings": {
    "MyDbConnection": {
      "ConnectinoString": "..",
      "ProviderName": "Microsoft.Data.SqlClient"
    }
  }
}
```
```csharp
var connectionConfig = config.GetSection("ConnectionStrings").GetSection("MyDbConnection");
DbProviderFactory dbFactory = DbProviderFactories.GetFactory(connectionConfig.ProvderName);
using DbConnection dbConn = dbFactory.CreateConnection();
dbConn.ConnectionString = connectionString.ConnectionString;
dbConn.Open();
using DbCommand dbCmd = dbConn.CreateCommand();
```

### Asynchronous Programming
```csharp
using (DbConnection conn = dbFactory.CreateConnection()) {
  await conn.OpenAsync();
  using (DbCommand selCmd = conn.CreateCommand()) {
    selCmd.CommandText = "SELECT name, age FROM Person";
    selCmd.Connection = conn;
    using (DbDataReader reader = await selCmd.ExecuteReaderAsync()) {
      while (await reader.ReadAsync())
        Process(new Person((string) reader["name"], (int) reader["age"]));
    }
  }
}
```

### Transactions
* transactions are atomic actions on the database (either commit or rollback)
```csharp
DbCommand cmd = new SqlCommand(sql, connection);
DbTransaction trans = connection.BeginTransaction(IsolationLevel.ReadCommitted);
cmd.Transaction = trans;

try {
  cmd.CommandText = "UPDATE ..."; cmd.ExecuteNonQuery();
  cmd.CommandText = "UPDATE ..."; cmd.ExecuteNonQuery();
  trans.Commit();
} catch(Exception e) {
  trans.Rollback();
}
```

## DataSets
* representing data (instead using domain classes)
* disadvantage: complicated to implement
* advantage: basis for optimistic locking
* optimistic locking: only make database update when data did not change in the meantime
* Data Adapter are the connection to the data source

## DAO Pattern
* data access object implements an interface
* factory creats the concrete data access object
