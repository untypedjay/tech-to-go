# Introduction
## Java Tools
* compiler `javac`
* interpreter (Java Runtime System, "`java`")
* virtual machine (Java Runtime Environment, "`JRE`"): contains the interpreter, makes it platform independent
* Java Development Kit, "`JDK`": contains the compiler
* Java Package program: jar (java archive)
* JDK = JRE + Development Tools
* JRE = JVM + Library Classes

## Hello World
One public class per file, the class needs to be named like the file.
```java
public class HelloWorld {
  public static void main(String[] args) {
    System.out.println("Hello World");
  }
}
```
```shell
javac HelloWorld.java
java HelloWorld
```
No class file is made until the errors are corrected and the compile command is run again.

## `manifest.txt`
If having multiple files, the compiler needs to know where the `main` method is.
```
Manifest-Version: 1.0
Main-Class: FirstClass
```
```shell
jar -cfm myProgram.jar manifest.txt FirstClass.class AnotherOne.class
java -jar myProgram.jar
```

## Inspecting the Bytecode
```shell
javap -c HelloWorld.class
```

## See Installation Path
```shell
/usr/libexec/java_home -v 11.0.7
```

## Code Conventions
* classes in Uppercase
* methods in lowercase
* packages in lowercase
* variables in lowercase
* composite names in camelCase
* constants in CAPS

## Visibility
* `public`: public public visibility
* no descriptor: package visibility
* `protected`: only in derived classes visible
* `private`: same class only visible
