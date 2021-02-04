# ADO.NET
## Design
* separation of data access and data manipulation
* supporting multi-layer applications
* ADO.NET is foundation for OR mapper

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

### Connections
* represents a database connection
* `ConnectionString` includes parameters for the connection
```csharp
using (IDbConnection conn = new SqlConnection(myConnStr)) {
  conn.Open();
  using (IDbCommand cmd = new SqlCommand(sqlQuery, conn)) {
    ...
  }
} // conn.Displose() -> conn.Close()
```

### DataReader
* iterate through data sets
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
* `ExecuteNonQuery`: reading database commands (insert, update, delete), return value is number of affected data sets
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

### Transactions
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
* advantage: foundation for optimistic locking
* optimistic locking: only make database update when data did not change in the meantime

## DAO Pattern
* data access object implements an interface
* factory creats the concrete data access object
