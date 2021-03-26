# Spring Introduction
Spring is a lightweight container framework which is based on Inversion of Control and Aspect Oriented Programming.

Dependency Injection can be treated almost synonymously with Inversion of Control. It is a mechanism to achieve Loose Coupling between components.
* **lightweight**: modular, business logic independent of the framework, no heavy runtime container necessary
* **Inversion of Control**: components get notified of dependencies (from the container)
* **Aspect Oriented Programming**: business logic and system services are separated from each other
* **container**: responsible for the component lifecycle, manages dependencies between components

## Basic Application Structure
* Business Logic (components -> interfaces)
* Client (configuration file, main method)
* Spring (BeanFactory/ApplicationContext)

```java
public interface GreetingService {
  void sayHello();
}

public class GreetingServiceImpl implements GreetingService {
  private String message;
  
  public void setMessage(String message) {
    this.message = message;
  }
  
  public void sayHello() {
    System.out.println(message);
  }
}
```

### File-based Configuration
`greetingService.xml`
```java
<!DOCTYPE ... "http://www.springframework.org/dtd/spring-beans.dtd">
<beans>
  <bean id="greetingService" class="GreetingServiceImpl">
    <property name="message">
      <value>Hello World</value>
    </property>
  </bean>
</beans>
```
Main program:
```java
BeanFactory factory = new ClassPathXmlApplicationContext("greetingService.xml"));
GreetingService bean = factory.getBean("greetingService", GreetingService.class);
bean.sayHello();
```

### Class-based Configuration
```java
@Configuration
public class GreetingConfig {
  @Bean(name="greetingService")
  public GreetingService getGreetingService() {
    var greetingService = new GreetingServiceImpl();
    greetingService.setMessage("Hello again, Spring fans");
    return greetingService;
  }
}
```
Main program:
```java
BeanFactory factory = new AnnotationConfigApplicationContext(GreetingConfig.class);
GreetingService bean = factory.getBean("greetingService", GreetingService.class);
bean.sayHello();
```
