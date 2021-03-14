# O/R Mapping
> An O/R mapper maps object oriented classes of an application to the relational model of a database.

An O/R mapper consists of the following components:
* ways to describe the mapping of classes to tables (metadata)
* API for CRUD operations
* query language, embedded into the object model
* transaction handling
* caching strategies

**Advantages**:
* productivity: save JDBC code
* maintainability: less lines of code
* capsulation: persistence layer is separated from rest of the application
* independence of DBMS
* efficiency: ORM developed by database experts

**Disadvantages**:
* efficiency: optimized self-written code is always more efficient
* not suitable for all applications (e.g. when having a lot of bulk updates)

## Paradigm Conflict
### Persistence
Data lives longer than the application so the data needs to be stored on an external medium.
* persist data using the Java class library (IO streams)
  * serialize entire object graphs
  * not everything is needed to be serialized
  * single objects cannot be accessed in byte stream
* persist date using a relational database
  * foundation is the relational algebra
  * sophisticated DBMSs
  * exchange of data between different technologies and platforms
  * standardized query language (SQL)

### Object Orientation vs. Relations
**Granularity**

A relation between an employee and an address can be mapped on a relational model in two ways:
1. two tables where employee has a FK to address
2. one table where all address properties are in the employee table as well (more efficient, costs more memory through NULL entries, some constraints cannot be implemented)

**Inheritance**

There are four ways to map inheritance.
How are polymorph relationships mapped? (e.g. employee can be permanent or temporary)
How are polymorph queries done (SQL does not support this)?

**Identity**

* Java: identity (`a == b`) or equality (`a.equals(b)`)
* relations: primary key
* if the same database entry gets loaded twice, are the Java objects identical or equal?

**Navigation in Object Graph (N -> 1)**

* Java: `project.getManager().getDepartment();`
* relations: 3 SELECTs (project -> employee -> department) or JOIN

**Navigation in Object Graph (1 -> N)**

* Java:
```java
Project proj = loadProject(projIdd);
for (Employee empl : proj.getMembers()) {
  process(empl.getLogbookEntries());
}
```
* relations: JOIN or 1 SELECT (employee) and N SELECTs (LogbookEntry) -> "n+1 selects problem"

**Relationships**

* M:N relationships easy in Java through container with references but needa an additional table in database
## Simple Example with Hibernate and the JPA
## Architecture of Hibernate and the JPA
## Mapping of Persistent Classes to the Database
## Persistence Manager
## Transactions & Caching
