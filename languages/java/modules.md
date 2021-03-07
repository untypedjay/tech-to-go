# Modules
## `module-info.java`
```java
module module1 {
  requires module2;
  exports package1;
}
```
* convention: module name = name of base package (e.g. `com.example.hello`)
* `requires`: module dependencies
* `exports`: export package with public types

## Module Archive
* module archive = java archive + module declaration

## Example
* in the project `src` directory, create a module folder and `module-info.java` inside it:
```java
module com.example.hello { }
```

* add the source code in the module:

`com.example.hello/com/example/hello/HelloWorld.java`

* create the folder structure `mods/com.example.hello` in root folder
* compile the module to the `mods` directory:
```shell
java -d mods/com.example.hello src/com.example.hello/module-info.java src/com.example.hello/como/example/hello/HelloWorld.java
```
* run the program:
```shell
java --module-path mods -m com.example.hello/com.example.hello.HelloWorld
```
