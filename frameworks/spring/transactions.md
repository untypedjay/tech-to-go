# Transactions
Transactions group database operations to an atomic unit (either `commit` or `rollback`).
They should be in the business logic layer.

## Spring Transaction Manager
Spring delegates the transaction management to specific database access technologies.

## Implementation of Transactions
1. define transaction manager
2. define transactions
  * programmatic (dependency injection & template method) OR
  * declarative
    - set transaction attributes (transaction advice): propagation behavior, isolation level, ...
    - integrate transactions into business logic: define pointcuts, connect to transaction advice

### Definition of Transaction Manager
XML-based:
```xml
<bean id="entityManagerFactory" class="...LocalContainerEntityManagerFactoryBean">
  <property name="dataSource" ref="dataSource"/>
</bean>
<bean id="transactionManager" class="org.springframework.orm.jpa.JpaTransactionManager">
  <property name="entityManagerFactory" ref="entityManagerFactory"/>
</bean>
```
Java-based:
```Java
@Configuration
public class AppConfig {
@Bean
public LocalContainerEntityManagerFactoryBean entityManagerFactory() { ... }

@Bean
public PlatformTransactionManager transactionManager() {
  return new JpaTransactionManager(entityManagerFactory());
  }
}
```

### Transaction Definition
Programmatic (transaction code from Spring in business layer):
```xml
<bean id="transactionTemplate" class="org.springframework...TransactionTemplate">
  <property name="transactionManager" ref="transactionManager"/>
</bean>
<bean id="workLog" class="com.example...WorkLogImpl">
  <property name="transactionTemplate" ref="transactionTemplate"/>
</bean>
```
```java
private TransactionTemplate transactionTemplate;
public void setTransactionTemplate(TransactionTemplatetemplate) {
  this.transactionTemplate= template;
}

public Employee updateEmployee(final Employee employee) {
  return transactionTemplate.execute((TransactionStatustransStat) -> employeeDao.merge(employee)); // commit if no exception is thrown, rollback otherwise
}
```

Declarative (transaction borders need to be joinpoints):
```xml
<tx:adviceid="txAdvice" transaction-manager="transactionManager">
  // set transaction attributes
</tx:advice>
<aop:config>
  <aop:pointcutid="transactedOps" expression="..."/>
  <aop:advisoradvice-ref="txAdvice" pointcut-ref="transactedOps"/>
</aop:config>
```

#### Transaction Attributes
Transaction attributes define, how transactions are applied to methods.
Categories:
* propagation: declare transaction borders
* isolation level
* read-only hints: optimization opportunities for reading transactions
* rollback-for, no-rollback-for: checked exceptions do not cause a rollback by default, runtime exceptions do
* transaction timeout

Propagation Attributes:
* PROPAGATION_REQUIRED
* PROPAGATION_REQUIRES_NEW
* PROPAGATION_MANDATORY
* PROPAGATION_SUPPORTS
* PROPAGATION_NOT_SUPPORTED
* PROPAGATION_NEVER
* PROPAGATION_NESTED

Isolation Levels:
* READ_UNCOMMITED
* READ_COMMITED
* REPEATABLE_READ
* SERIALIZABLE
* DEFAULT
