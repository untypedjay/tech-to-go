# Implementing REST Services Using Spring MVC
* configuration using Spring Boot
* define domain models
```java
public class Employee {
  private int id;
  
  private String lastName;
  
  @JsonFormat(pattern="yyyy-MM-dd")
  private LocalDate dateOfBirth;
  
  @JsonProperty(name="lastname")
  public String getLastName() { ... }
  
  public void setLastName(String lastName) { ... }
  
  @JsonIgnore
  public Set<Address> getAddresses() { ... }
  ...
}
```
* implement controller classes
```java
@RestController
@RequestMapping(value="/worklog")
public class EmployeeRestController {
  @GetMapping("/employees")
  public Collection<Employee> getAll() { ... }
  
  @RequestMapping(value="/employees/{id}", method=RequestMethod.PUT)
  public void update(@PathVariableLong id, @RequestBodyEmployee employee) { ... }
  ...
}
```

## Parameter Injection
```java
public class EmployeeRestController {
  @GetMapping(value="/employees?start={start}&size={size}")
  public Collection<Employee> getAll(@RequestParam(defaultValue="0") Long start, @RequestParam(required=false)Long size) { ... }
  
  @PutMapping(value="/employees/{id}")
  public void update(@PathVariable Long id, @RequestBody Employee employee) { ... }
}
```

## Return Parameters
```java
@PutMapping("/employees/{id}")
@ResponseStatus(HttpStatus.NO_CONTENT)
public void update(@PathVariableLong id, @RequestBodyEmployee empl) { ... }

@PostMapping("/employees")
public ResponseEntity<Employee> insert(@RequestBody Employee employee) {
  employee = employeeRepository.save(employee);
  URI location = // build URI of newly inserted resource
  return ResponseEntity.created(location).body(employee);
}
```

## Error Handling
### Setting Error Status Code
```java
@GetMapping("/employees/{id}")
public ResponseEntity<Employee> getById(@PathVariable Long id) {
  return employeeRepository.findById(id).map(e -> ResponseEntity.ok(e)).orElse(ResponseEntity.notFound().build());
}
```
### Throw Exception
```java
@GetMapping("/employees/{id}")
public Employee getById(@PathVariableLong id) {
  return employeeRepository.findById(id).orElseThrow(() -> new EmployeeNotFoundException(id));
}
```
```java
@ResponseStatus(HttpStatus.NOT_FOUND)
public class EmployeeNotFoundException extends RuntimeException{
}
```
### `ResponseEntityExceptionHandler`
* exception handling can be defined globally

## Content Negotiation
* different resource representation supported (XML, JSON, YAML, ...)
* mime type can be set in HTTP header `Content-Type`
* accepted representations can be set in HTTP header `Accept`
* if asked content type is not supported, status code 406 (Not Acceptable) will be returned
```java
@GetMapping(alue="/employees/{id}", produces=MediaType.APPLICATION_XML_VALUE)
public EmployeegetByIdXml(@PathVariableintid) { ... }

@GetMapping(alue="/employees/{id}", produces=MediaType.APPLICATION_JSON_VALUE)
public Employee getByIdJson((@PathVariableintid) { ... }
```
* if incoming content type is not supported, status code 415 (Unsupported Media Type) will be returned
```java
@PutMapping(value="/employees/{id}", consumes=MediaType.APPLICATION_JSON_VALUE)
public void update(@PathVariableLong id, @RequestBodyEmployee employee) { ... }
```
