# Architecture of Spring Application
## 3-Layer Architecture
* Service (Controller)
* Business Logic
* Persistence (DAOs)
Every layer only accesses interfaces. Dependencies will be defined using Dependency Injection. Domain objects will be used in all layers.
