# Spring Boot
* easy dependency management

## Important Dependencies
* `spring-boot-starter-parent`: definition of versions with compatible dependencies
* `spring-boot-starter`: base packages for auto config, logging, ...
* `spring-boot-starter-web`: web development using Spring Web MVC and Tomcat
* `spring-boot-starter-data-{jpa,mongodb,rest,redis,...}`: data access with Spring Data
* `spring-boot-starter-test`: JUnit, Hamcrest, Mockito, Spring Test
* `spring-boot-starter-actuator`: web application monitoring

## Application Structure
* main class should be in root package
* `SpringAppllication.run`: sets configuration class, creates bean factory, executes `CommandLineRunner` (e.g. create database schema) and starts the web application (including web server)
* `@SpringBootApplication`: shortcut for `@Configuration` (configure beans), `@ComponentScan` and `@EnableAutoConfiguration`

## Configuration Classes
* it is recommended to prefer Java-based configuration
```java
@Configuration
@ImportResource({"/my-applicationContext.xml"})
public class AppConfig {
  @Bean
  public MyService myService() {
    return new MyService();
  }
  @Bean
  public MyController myController() {
    return new MyController(myService());
  }
}
```

## `CommandLineRunner`
* components that implement `CommandLineRunner` will be executed at the end of `SpringApplication.run`
```java
@Component
public class DatabaseInitializer implements CommandLineRunner {
  @Autowired
  private EmployeeDao emplDao;
  
  @Override
  public void run(String... args) {
    emplDao.save(new Employee(...));
  }
}
```

## Configuration Parameters
application.properties
```
# logging
logging.path=c:/temp/spring-boot

# database
spring.datasource.url=jdbc:derby://localhost/WorkLogDb;create=true
spring.datasource.driver-class-name=org.apache.derby.jdbc.ClientDriver

# Hibernate/JPA
spring.jpa.show-sql=false
spring.jpa.hibernate.ddl-auto=create-drop

# web server
server.port=8080
```
Access:
```java
@Component
public class MyBean {
  @Value("${server.port}")
  private String port;
}
```

## Implementation of a Web Application
* add `spring-boot-starter-web`
* add template engine (e.g. Thymeleaf)
* implement controller
```java
@Controller
public class HelloController {
  @RequestMapping("/")
  public String sayHello(Model model) {
    model.addAttribute("message", "Hello world");
    return "hello";
  }
}
```
* implement HTML template
```html
<html xmlns:th="http://www.thymeleaf.org">
  <body role="document">
    <h1 th:text="${message}">Hello world (design)</h1>
  </body>
</html>
```
