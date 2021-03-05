# Exceptions
A `try`-Block contains all statements that could cause an exception. The `catch`-Block will be executed if an exception is thrown.

```java
import javax.swing.*;
public class DiaInput {
	public static double diaDoubleInput() throws NumberFormatException {
		String input = "";
		double number = 0.0;
		input = JOptionPane.showInputDialog("Please enter a number!");
		number = Double.parseDouble(input);
		return number;
	}

	public static void main(String[] args) {
		double number = 0.0;
		try {
				number = diaDoubleInput();
		} catch (NumberFormatException e) {
				JOptionPane.showMessageDialog(null, "Was not a good number!");
				inputProblem = true;
		}
		System.out.println((number * number));
	}
}
```

## Catching All Exceptions
```java
} catch (Exception e) {
```

## `catch`-Parameters

### getMessage

```java
} catch (NumberFormatException e) {
	String error = e.getMessage());
	JOptionPane.showMessageDialog(null, error);
}
```

### toString
Adds the name of the exception class.

```java
} catch (NumberFormatException e) {
	String error = e.toString();
	JOptionPane.showMessageDialog(null, error);
}
```

### printStackTrace
Shows all method calls that caused the exception.

```java
} catch (NumberFormatException e) {
	e.printStackTrace();
}
```

### Custom Exceptions
```java
class DoNothingException extends Exception {
	@Override
	public String getMessage() {
		return "I do nothing!";
	}
}

class DoSomething {
	public void doSomething() throws DoNothingException {
		throw new doNothingException();
	}
}
```

## Class Hierarchy
- `RuntimeException` (usually through programming bugs which cannot be recovered by the user, unchecked)
    - `NullPointerException` (access to `null`-references)
    - `IllegalArgumentException` (wrong parameter)
        - `IllegalFormatException` (wrong format)
        - `InvalidKeyException` (invalid key)
        - `PatternSyntaxException` (syntax error)
    - `IndexOutOfBoundsException` (out of array bounds)
    - `NegativeArraySizeException` (negative size of array)
- `IOException`
    - `FileNotFoundException` (file not found)
    - `EOFException` (sudden end of file)
    - `UnknownHostException` (host not accessible)
    - `UnknownServiceException` (service not accessible)
- `AWTException` (thrown by AWT)
- `ClassNotFoundException` (unknown classname)
- `TimeoutException` (time-out of blocking operations)
