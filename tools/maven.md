# Maven
Maven is a project management and comprehension tool that provides developers a complete build lifecycle framework.

## Project Object Model (POM)
The POM contains information about the project and various configuration details used my Maven to build the projects.

`pom.xml` example and mandatory elements:
```xml
<project xmlns = "http://maven.apache.org/POM/4.0.0"
   xmlns:xsi = "http://www.w3.org/2001/XMLSchema-instance"
   xsi:schemaLocation = "http://maven.apache.org/POM/4.0.0
   http://maven.apache.org/xsd/maven-4.0.0.xsd">
   <modelVersion>4.0.0</modelVersion>

   <groupId>com.companyname.project-group</groupId>
   <artifactId>project</artifactId>
   <version>1.0</version>
</project>
```
The model version should be 4.0.0.
