# Aspect Oriented Programming (AOP) with Spring
Some tasks (logging, security, transactions, resource management...) are spread around the entire application (cross-cutting concerns).
AOP makes it possible to group those tasks together (modularization of cross-cutting concerns) and use them without calling them.

## Definitions
* aspect: module-crossing functionality (e.g. logging) consisting of multiple advices and a _pointcut_
* advice: code that gets executed on specific parts (_joinpoints_) of the application
* joinpoint: point where an advice can be executed in the _target_ method
* pointcut: set of _joinpoints_
* introduction: extension of a class
* target: target class where _advices_ get applied
* proxy: resulting class when _target_ gets extended by _advices_
* weaving: inserting _advices_ (compile time, class loading time or execution time)

## Types of Advices in Spring
* Before: advice will be executed before method in target
* After / AfterReturning: advice will be executed after (successful) execution of method in target
* AfterThrowing: advice will be executed after throwing an exception
* Around: advice surrounds method in target (advice chooses point of execution)
* Introduction: add new method in target

## Implementing Aspects
1. implementation of advices (class)
2. definition of the aspect (class of advice, definition of pointcuts)
3. `BeanFactory` creates classes at run time

Aspects can be defined using either XML-based or annotation-based configuration.

## Joinpoint Interfaces
Advice methods receive an object of the type `[Proceeding]JoinPoint` which contains metadata about the call.
* `getArgs`: argument list how the proxy was called
* `getSignature`: method signature
* `getTarget`: target reference
* `getThis`: proxy reference
* `proceed`: method call will be delegated to target object

## Implementing Advices
```java
public class TraceAdvice {
  public void traceBefore(JoinPoint jp) {
    String methodName = jp.getTarget().getClass().getName() + "." + jp.getSignature().getName();
    System.out.println("--> " + methodName);
  }
  
  public void tradeAfter(JoinPoint jp) {
    String methodName = jp.getTarget().getClass().getName() + "." + jp.getSignature().getName();
    System.out.println("<-- " + methodName);
  }
  
  public Object tradeAround(ProceedingJoinPoint pjp) throws Throwable {
    String methodName = jp.getTarget().getClass().getName() + "." + jp.getSignature().getName();
    System.out.println("--> " + methodName);
    Object retVal = pjp.proceed(); // delegates to method of target class
    System.out.println("<-- " + methodName);
    return retVal;
  }
}
```

## Pointcuts
A pointcut expression contains:
1. type of joinpoint: method call (`execution`), all joinpoints (`within`), ...
2. signature of joinpoints: regex: "*" for arbitrary characters except .; ".." for arbitrary characters

**Examples:**
* `execution(public * set*(..))`: all public setter methods
* `execution(* com.example.ServiceImpl.*(..))`: all methods of `ServiceImpl`
* `execution(* com.example.*.*(..))`: all methods in package `com.example`
* `execution(* com.example..*.*(..))`: all methods in all subpackages of `com.example`
* `within(com.example..*)`: all joinpoints in all subpackages of `com.example`

## XML-based Definition of Aspects
```xml
<bean id="workLog" class="com.example...WorkLogImpl"/>
<bean id="traceAdvice" class="com.example...TraceAdvice"/>
<aop:config>
  <aop:aspectid="traceAspect" ref="traceAdvice">
    <aop:pointcutid="findMethods" expression="execution(public * com.example..*find*(..))"/>
    <aop:pointcutid="findByIdMethods" expression="execution(public * com.example..*find*ById*(..))"/>
    <aop:beforepointcut-ref="findMethods" method="traceBefore"/>
    <aop:after-returningpointcut-ref="findMethods" method="traceAfter"/>
    <aop:aroundpointcut-ref="findByIdMethods" method="traceAround"/>
  </aop:aspect>
</aop:conifg>
```

## Annotation-based Definition of Aspects
```java
@Aspect
public class TraceAdvice {
  @Before("execution(public * com.example..*find*(..))")
  public void traceBefore(JoinPoint jp) { ... }
  
  @AfterReturning("execution(public * com.example..*find*(..))")
  public void traceAfter(JoinPoint jp) { ... }
  
  @Around("execution(public * com.example..*find*ById*(..))")
  public Object traceAround(ProceedingJoinPointp jp) throws Throwable {
    ...
    Object retVal = pjp.proceed();
    ...
    return retVal;
  }
}
```

## AOP Client
```java
BeanFactoryfactory = new ClassPathXmlApplicationContext("applicationContext.xml");
WorkLogFacadeworkLog = factory.getBean("workLog“, WorkLogFacade.class);
workLog.findAllEmployees();
workLog.findEmployeeById(3L);
long cnt = ((Monitored)workLog).getInvocationCount();
System.out.format("invocationCount=%d%n", cnt);
```
