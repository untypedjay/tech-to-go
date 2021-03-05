# Datatypes
## Primitive Datatypes
* built into the language
* has always a value

|Type|Memory in Bits|Description|Default Value|
|:-------|:-------:|:--------|:--------|
|`boolean`|8|`true` or `false`|false|
|`byte`|8|one byte: -128 to 127|0|
|`char`|16|characters, single quotes|'\u0000'|
|`short`|16|-32.768 to 32.767|0|
|`int`|32|-2.147.483.648 to 2.147.483.647|0|
|`long`|64|-9.223.372.036.854.775.808 to 9.223.372.036.854.775.807|0L|
|`float`|32|floating point numbers|0.0f|
|`double`|64|floating point numbers with more digits after comma (max: 17 digits with 307 digits after comma)|0.0d|

### Casting

```java
public class Casting {
  public static void main(String[] args) {
    short shortNumber = 2;
    long longNumber = 4;
    shortNumber = (short) longNumber;
    System.out.println(kurz),
  }
}
```

## Reference Types
* created by the programmer
* can be `null`

### String
Strings are immutable. When assigning a string variable, the variable stores a reference to the originial.
```java
String output = "My name is Bond.";
String emptyString = "";
String nullString = null;
```

#### String Manipulation
```java
output = "My name is Bond." + " James Bond.";
output = "My name is Bond.".concat(" James Bond.");
char character = output.charAt(1); // -> e
boolean equal = output.equals("My name is Bond. James Bond.");
boolean equal = output.equalsIgnoreCase("My name is BOND. James Bond.");
int laenge = output.length();
boolean isEmpty = output.isEmpty();
boolean isContained = output.contains("Bond");
String newString = output.trim(); // remove whitespace at front and back
int position = output.indexOf("Bond");
int position = output.indexOf("Bond", 15); // search from position 15 onwards
String bond = output.substring(26);
String bond = output.substring(26, 30);
String itsMe = output.replace("Bond", "Jeff");
String me007 = output.replaceAll("[A-Z]o.d", "Jeff"); // regex
```

#### Type Conversion
```java
int numberVariable = 7;
String numberString = "" + numberVariable;

int number = Integer.parseInt("122");
double number = Double.parseDouble("12.2");
```

#### StringBuffer
#### StringBuilder

### Array
```java
int lotto[] = new int[6];
for (int zahl : lotto) {
	System.out.println(zahl);
}
```

### Class
```java
public class Date {
	int year;
	int month;
	int day;
	private int weekDay;
	public int getWeekDay() {
		return weekDay;
	}
	public void move() {
		month++;
		if (month > 12) {
			month = 1;
			year++;
		}
	}
	public Date clone() { // deep copy
		Date duplicate = null;
		duplicate = new Date();
		doppel.tag = this.day;
		doppel.month = this.month;
		doppel.year = this.year;
		return duplicate;
	}
	public boolean equals(Date compare) {
		return compare.year == this.year && compare.month = this.month && compare.day == this.day;
	}
	public String toString() {
		return "" + day + "." + month + "." + year;
	}
};
```

#### Private Classes
Private classes are always useful, if it is only used by one class.
```java
public class HasPrivateClass {
	private class WeekDay {
		int weekDay = -1;
		String name = "";
	}
	private int day, month, year;
	private WeekDay weekDay = new WeekDay();
	public String getWeekDayName() {
		return weekDay.name;
	}
}
```

#### Nested Classes
The inner class has always access to the elements of the class where it is nested in. The access is done through `Outer.this.outerInt`.

#### Constructors
```java
class Date {
	private int year, month, day;
	Date() {
		year = 0; month = 0; day = 0;
	}
}

class Date {
	private int year, month, day;
	Date(int year, int month, int day) {
		this.year = year;
		this.month = month;
		this.day = day;
	}
}
```

#### Singleton
```java
public final class Singleton {
	private static Singleton singleton = null;
	private Singleton() {
	}
	public static synchronized Singleton getInstance() }
		if (singleton == null) {
			singleton = new Singleton();
		}
		return singleton;
	}
}
```
The keyword `synchonized` makes it impossible to use the method by two thread concurrently.

#### Inheritance
```java
class PeaSoup extends Soup {
	public String getName() {
		return "Pea soup";
	}
	@Override
	public double costs() {
		return super.costs() + 0.01;
	}
}
```

#### Abstract Classes & Methods
* abstract classes cannot create objects
* every abstract class needs to be overridden by a derived class
```java
abstract class Soup {
	public double costs() {
		return 0.70;
	}
	abstract public String getName();
}
```

### Interface
Interfaces are abstract classes that only contain abstract methods and no attributes.
```java
interface Dish {
	public double costs();
	public String getName();
}

abstract class Soup implements Dish {
	public double costs() {
		return 0.70;
	}
}
```

## Constants
```java
final int BEER_BOTTLES = 6;
```
