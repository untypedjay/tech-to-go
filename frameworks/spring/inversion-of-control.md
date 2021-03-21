# Inversion of Control (Dependency Injection)
Components need to be registered in the container in order to make Dependency Injection work.

**Component Scan**: Framework looks for the components automatically

## Example
* component is framework independent
* only dependency is the interface of the logger 
```java
public class WorkLogImpl {
  public WorkLogImpl() {}
  
  public void setLogger(Logger logger) {
    this.logger = logger;
  }
  
  public Employee findEmployeeById(Long id) {
    Emplyoee empl = ...
    logger.log("FindEmployeeById(" + id + ") --> " + empl.toString());
    return empl;
  }
}
```
`applicationContext.xml`
```xml
<beans>
  <bean id="consoleLogger" class="ConsoleLogger"/>
  <bean id="fileLogger" class="FileLogger"/>
  <bean id="workLog" class="WorkLogImpl">
    <property name="logger">
      <ref bean="consoleLogger"/>
    </property>
  </bean>
</beans>
```
```java
BeanFactory factory = new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));
WorkLogImpl workLog = factory.getBean("workLog", WorkLogImpl.class);
Employee empl = workLog.findEmployeeById(1L);
```
