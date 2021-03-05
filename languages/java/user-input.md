# User Input
## Integer
```java
public class IntInput {
	public static void main(String[] args) {
		java.util.Scanner scan = new java.util.Scanner(System.in);
		int number;
		number = scan.nextInt();
		System.out.println(number);
	}
}
```

## Strings
```java
import java.util.Scanner;

public class StringInput {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		String string = scanner.nextLine();
		System.out.println(string);
	}
}
```

## Commandline Parameters
```java
public class ShowArgs {
	public static void main(String[] args) {
		for (String str : args) {
			System.out.println(str);
		}
	}
}
```
