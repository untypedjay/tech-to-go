# Bean Configuration Using `BeanFactory` and `ApplicationContext`
Main responsibilities of the `ApplicationContext`:
* lifecycle management of Spring Beans
* building the Bean graph

More responsibilities:
* loading resources (from file system, class path, ...)
* internationalization
* firing of events

## Creating and Destroying of an `ApplicationContext`
```java
try (AbstractApplicationContext factory = new ClassPathXmlApplicationContext("<path>/applicationContext.xml")) {
  // working with beans
}
```

## Structure of an `<bean>` Element
```xml
<bean
  id="workLog"
  class="com.example.WorkLogImpl"
  init-method="setup"
  destroyMethod="dispose"
>
  <property name="maxEmployees">
    <value>100</value>
  </property>
</bean>
```

### Attributes
* `init-method` (optional): method which gets called after setting the properties
* `destroy-method` (optional): method which gets called when closing the container

### Properties
* setting initial Bean properties
* Example: `workLog.setMaxEmployees(100)`
* values are converted into property type using property editors

**Container Properties**
* List
```xml
<property name="listProp">
  <list>
    <value>1000</value>
    <ref bean="otherBean"/>
  </list>
</property>
```
* Set
* Map
```xml
<property name="mapProp">
  <map>
    <entry key="key1">
      <value>1000</value>
    </entry>
    <entry key="key2">
      <ref bean="otherBean"/>
    </entry>
  </map>
</property>
```
* Properties
```xml
<property name="propProp">
  <props>
    <prop key="key1">string 1</prop>
  </props>
</property>
```

## Structure of the Configuration File
```xml
<beans xmlns="http://www.springframework.org/schema/beans" xsi:schemaLocation="http://www.springframework.org/schema/beans ...">
  <bean id="workLog" class="com.example.WorkLogImpl" lazy-init="true">
    ...
  </bean>
  <bean id="employee" class="com.example.Employee" scope="prototype">
    ...
  </bean>
</beans>
```
* `id`: identifier; argument of `beanFactory.getBean()`
* `class`: `BeanFactory` creates objects of that class
* `lazy-init`: creation happens using `BeanFactory` or at first access
* `scope` (optional): `singleton` (default, always same instance), `prototype` (new instance every time), `request`/`session` (when using `WebApplicationContext`

## Setter vs Constructor Injection
### Setter Injection
```xml
<bean id="workLog" class="com.example.WorkLogImpl">
  <property name="employeeDao" ref="employeeDao"/>
</bean>
```
```java
workLog = new WorkLogImpl();
workLog.setEmployeeDao(employeeDao);
```

### Constructor Injection
```xml
<bean id="workLog" class="com.example.WorkLogImpl">
  <constructor-arg ref="employeeDao"/>
</bean>

```

```java
workLog = new WorkLogImpl(employeeDao);
```

## Java-based Configuration
```java
@Configuration
public class AppConfig {
  @Bean @Lazy
  public EmployeeDao employeeDao() {
    return new EmployeeDaoImpl();
  }
  
  @Bean(name="workLog")
  public WorkLogFacade getWorkLog() {
    return new WorkLogImpl(employeeDao());
  }
}
```
```java
public class EmployeeDaoImpl implements EmployeeDao {
  public EmployeeDaoImpl() { ... }
  @PostConstruct
  public void init() { ... }
  @PreDestroy
  public void destroy() { ... }
}
```
* `@Configuration`: class that works as a bean factory
* `@Bean`: factory method that creates the bean object

### Dependency Injection Using `@Autowired`
```xml
<context:annotation-config/>
<bean id="employeeDaoJdbc" class="com.example.EmployeeDaoJdbcImpl"/>
```
```java
public class WorkLogImpl implements WorkLogFacade {
  @Autowired(required=true)
  private EmployeeDao employeeDao;
}
```
**Constructor Injection**:
```java
public class WorkLogImpl implements WorkLogFacade {
  @Autowired
  public WorkLogImpl(@Dao EmployeeDao dao) { ... }
}
```
**Setter Injection**:
```java

public class WorkLogImpl implements WorkLogFacade {
  @Autowired @Dao
  public setEmployeeDao(EmployeeDao dao) { ... }
}
```

### Dependency Injection Using `@Resource`
* from Java EE
```xml
<context:annotation-config/>
<bean id="employeeDaoJdbc" class="com.example.EmployeeDaoJdbcImpl"/>
```
```java
public class WorkLogImpl implements WorkLogFacade {
  @Resource(name="employeeDaoJdbc") // default lookup for employeeDao
  private EmployeeDao employeeDao;
}
```
### Dependency Injection Using `@Inject`
```xml
<context:annotation-config/>
<bean id="employeeDao" class="com.example.EmployeeDaoJdbcImpl"/>
```
```java
public class WorkLogImpl implements WorkLogFacade {
  @Inject @Named("employeeDao")
  private EmployeeDao employeeDao;
}
```

### Qualifier
In order to prevent ambiguous beans, qualifiers can be used to resolve them.
```java
@Qualifier
@Target({ElementType.FIELD, ElementType.METHOD, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
public @interface Dao {
  String technology() default "JPA"
}
```
```java
@Dao(technology="JDBC")
public class EmployeeDaoJdbc implements EmployeeDao { ... }
```
```java
public class WorkLogImpl implements WorkLogFacade {
  @Inject @Dao(technology="JDBC")
  private EmployeeDao employeeDao;
}
```

## Bean Registration
Beans need to be registered in order to be found by the bean factory. This can be done in two ways:
1. explicit registration in configuration file or with `@Bean` annotation
2. automatic registration (component scan) by looking up injection annotations using configuration file (see below) or `@ComponentScan` on configuration class
```xml
<context:component-scan base-package="com.example"/>
```
