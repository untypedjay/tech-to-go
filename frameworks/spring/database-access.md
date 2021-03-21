# Database Access
## Implementation of the Persistence Layer
1. configure data source
2. define DAO interfaces
3. implement DAO interfaces (inject template, provice technology specific code as callback, Spring translates technology specific exceptions into generic exceptions)
4. connect DAO implementation with data source in the configuration file

### XML-based Data Source Configuration
```xml
<context:property-placeholder location="jdbc.properties"/>
<bean id="dataSource" class="org.apache.commons.dbcp2.BasicDataSource" destroy-method="close">
  <property name="driverClassName" value="${jdbc.driverClassName}"/>
  <property name="url" value="${jdbc.url}"/>
</bean>
```
Generate DAO template:
```xml
<bean id="jdbcTemplate" class="org.springframework.jdbc.core.JdbcTemplate">
  <property name="dataSource" ref="dataSource"/>
</bean>
```
Connect DAO:
```xml
<bean id="emplDaoJdbc" class="com.example.db.dao.jdbc.EmployeeDaoJdbc">
  <property name="jdbcTemplate" ref="jdbcTemplate"/>
</bean>
```

### Java-based Data Source Configuration
```java
@Configuration
@PropertySource("jdbc.properties")
@ComponentScan(basePackageClasses= { ... })
public class AppConfig {
  @Value("${datasource.driver-class-name}")
  private String  driverClassName;
  
  @Bean
  public DataSourcedataSource() {
    BasicDataSource dataSource= new BasicDataSource();
    dataSource.setDriverClassName(driverClassName);
    ...
    return dataSource;
  }
  
  @Bean
  public JdbcTemplate jdbcTemplate() {
    return new JdbcTemplate(dataSource());
  }
}
```
```java
@Repository
public class EmployeeDaoJdbc implements EmployeeDao {
  @Inject
  private JdbcTemplate jdbcTemplate;
}
```

### DAO Method Example
Writing access:
```java
public void saveEmployee(final Employee e) throws DataAccessException {
  final String sql = "insert into Employee (firstName, lastName)" + " values (?, ?)";
  getJdbcTemplate().update(sql, e.getFirstName(), e.getLastName());
}
```

Reading Access:
```java
public Employee findEmployeeById(final Long id) throws DataAccessException {
  final String sql = "select id, firstName, lastName from Employee" + " where id = ?";
  final Employee empl = new Employee();
  final Object[] params= { id };
  RowCallbackHandler rowHandler = new RowCallbackHandler() {
    public void processRow(ResultSet rs) throws SQLException {
      empl.setId(rs.getLong(1));
      empl.setFirstName(rs.getString(2));
      empl.setLastName(rs.getString(3));
    }
  };
  getJdbcTemplate().query(sql, params, rowHandler);
  return empl.getId() == null ? null : empl;
}
```
```java
protected static class EmployeeRowMapper implements RowMapper<Employee> {
  public Employee mapRow(ResultSet rs, introwNum) throws SQLException {
    Employee empl = new Employee();
    empl.setId(rs.getLong(1));
    empl.setFirstName(rs.getString(2));
    empl.setLastName(rs.getString(3));
    return empl;
  }
}

public Collection<Employee> findAllEmployees() throws DataAccessException {
  final String sql = "select id, firstName, lastName from Employee";
  return getJdbcTemplate().query(sql, new EmployeeRowMapper());
}
```

## Database Access Using Hibernate
* instead of `JdbcTemplate`, `HibernateTemplate` is used
* needs a `SessionFactory`

Configuration:
```xml
<bean id="dataSource" class="org.apache.commons.dbcp2.BasicDataSource">
  ...
</bean>
<bean id="sessionFactory" class="org.springframework.orm.hibernate5.LocalSessionFactoryBean">
  <property name="dataSource" ref="dataSource"/>
  <property name="packagesToScan" value="com.example.worklog.domain"/>
  <property name="hibernateProperties">
    <props>
      <prop key="hibernate.dialect">org.hibernate.dialect.DerbyTenSevenDialect</prop>
      <prop key="hibernate.show_sql">true</prop>
    </props>
  </property>
</bean>
```

`HibernateTemplate`:
```xml
<bean id="hibernateTemplate" class="org.springframework.orm.hibernate5.HibernateTemplate">
  <property name="sessionFactory" ref="sessionFactory"/>
</bean>
<bean id="emplDaoHibernate" class="com.example.db.dao.hibernate.EmployeeDaoHibernate">
  <property name="hibernateTemplate" ref="hibernateTempale"/>
</bean>
```
```java
public class EmployeeDaoHibernate implements EmployeeDao {
  public void setHibernateTemplate(HibernateTemplatetemplate) { ... }
}
```

Writing Access:
```java
public Employee saveEmployee(Employee empl) throws DataAccessException {
  return (Employee)hibernateTemplate.merge(empl);
}
```

## Database Access Using JPA
Configuration of JPA provider:
```java
@Configuration
public class AppConfig {
  @Bean
  public DataSource dataSource() { ... }
  
  @Bean
  public LocalContainerEntityManagerFactoryBean entityManagerFactory() {
    LocalContainerEntityManagerFactoryBean emFactory = new LocalContainerEntityManagerFactoryBean();
    emFactory.setDataSource(dataSource());
    emFactory.setPackagesToScan("com.example.spring.worklog.domain");
    emFactory.setJpaVendorAdapter(new HibernateJpaVendorAdapter());
    emFactory.setJpaProperties(jpaProperties());
    return emFactory;
  }
}
```

Writing Access:
```java
@Repository
public class EmployeeDaoJpa implements EmployeeDao {
  @PersistenceContext
  private EntityManagerem;
  public Employee saveEmployee(Employeee) throws DataAccessException {
    return em.merge(e);
  }
}
```

## Spring Data
Spring Data makes it possible to generate data access classes automatically.

* extend database access interface from interface from Spring Data:
```java
@Repository
public interface EmployeeDao extends JpaRepository<Employee,Long> {
  List<Employee> findByLastName(String lastname);
  List<Employee> findByLastNameAndFirstName(String ln, String fn);
  List<Employee> findByAddressZipCode(String zipCode);
  List<Employee> findTop10ByDateOfBirth(String lastname);
  List<Employee> findByLastNameOrderByFirstNameAsc(String ln);
}

// OR

public interface EmployeeRepository extends JpaRepository<Employee,Long> {
  @Query("select e from Employee e where e.lastName= ?1")
  Employee findByLastNameV1(String lastName);
  
  @Query("select e from Employee e where e.lastName= :ln")
  Employee findByLastNameV2(@Param("ln")String lastName);
  
  @Modifying
  @Query("update Employee e set e.firstName= ?1 where e.lastName= ?2")
  int updateFirstNameFor(String firstname, String lastname);
}
```
Special Parameters:
```java
public interface EmployeeRepository extends JpaRepository<Employee,Long> {
  Optional<Employee> findByLastName(String lastName, Sortsort);
  List<Employee> findLastNameContaining(String subString, Sortsort);
  Page<Employee> findByAddessZipCode(String zipCode, Pageablepageable);
  Slice<Employee> findByProjectId(Long projectId, Pageablepageable);
}
```
```java
var users = employeeRepo.findLastNameContaining("huber", Sort.by("firstName"));
var page  = employeeRepo.findByAddressZipCode("4232", PageRequest.of(1, 5));
var slice = employeeRepo.findByProjectId(1L, PageRequest.of(2, 5, Sort.by("lastName").and(Sort.by("firstName).decending())));
```
* activate automatic DAO proxy generation:
```java
package com.example.data.dao;
@EnableJpaRepositories
public class Config {}
```
* inject DAO implementation:
```java
public class Client {
  @Autowired
  private EmployeeDaoe mplDao;
  public void updateName(Long id, String name) {
    Employee empl = emplDao.findOne(id);
    empl.setLastName(name);
    emplDao.save(empl);
  }
}
```
