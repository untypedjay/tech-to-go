# LINQ
* LINQ is a query language inside C# and VP.NET
* compiler checks syntax

Queries can be made on data that has a LINQ provider such as
* arrays
* collections
* XML
* database tables

```csharp
using System.Linq;
IEnumerable<Employee> employees = ...;
var query = from e in employees
              where e.City == "New York"
              select new { Id = e.Id, Name = e.Name };
```
