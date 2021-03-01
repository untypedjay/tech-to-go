# Types

Types can be value or reference based. Value based types live on the stack, reference based types live on the heap. Converting a value type into a reference type is called "boxing" (implicit). Converting a reference type into a value type is called "unboxing" (explicit with a cast).

```csharp
string s = 123.ToString(); // boxing

int i = 123;
object o = i; // boxing
int j = (int) o; // unboxing
```

## Value Types

- live on the stack or in the surrounded object
- default value is 0, '\0' or false

### Simple Types

All simple types that are compatible with the Common Language Specification:

|Name|CTS|Range|
|:---|:----|:-----|
|byte|System.Byte|0 - 2^8-1|
|short|System.Int16|-2^15 - 2^15-1|
|int|System.Int32|-2^31 - 2^31-1|
|long|System.Int64|-2^63 - 2^63-1|
|float|System.Single|7 decimal places, 4 bytes|
|double|System.Double|15 decimal places, 8 bytes|
|decimal|System.Decimal|28 decimal places, 16 bytes|
|bool|System.Boolean|true, false|
|char|System.Char|unicode characters|

```csharp
float number = 1.2f;
decimal number = 1.2m; // m for decimals
byte number = 2;
int count = 10;
char character = 'A';
bool isWorking = false;
```

### Enumeration

### Struct

```csharp
struct Color {
	public byte r, g, b;
	public Color(byte r, byte g, byte b) {
		this.r = r; this.g = g; this.b = b;
	}
}
```

```csharp
Color black = new Color();
Color yellow = new Color(255, 255, 0);
yellow.r = 200;
```

### Nullable Types

- value types that can have the value `null`
- `T?` or `Nullable<T>`

```csharp
public struct Nullable<T> where T : struct {
	public Nullable(T value);
	public bool HasValue { get; }
	public T Value { get; }
}
```

```csharp
int? i1 = 10;
int? i2 = null;
int j1 = i1.Value; // j1 == 10
int j2 = (int) i1; // j2 == 10
int j3 = i2 ?? 0; // j3 == 0
```

## Reference Types

- allocated on the heap
- default value is null

### Interface

### Pointer

### Array

### Class

Contents of a class:

- constants
- arrays
- constructors / destructors
- methods
- operators
- properties
- indexers
- events
- static constructors
- inner types

```csharp
class Rational {
	const double Eps = 0.001;
	int a, b;
	public Rational(int a, int b) { ... }
	public void Add(Rational c) { ... }
	public static Rational operator+(Rational r1, Rational r2) { ... }
	public int Denom {
		get { return b; }
		set { b = value; } 
	}
}
```

### Delegate

# Implicit Type Conversion

```csharp
byte b = 1; // 00000001
int i = b; // 00000000 00000000 00000000 00000001

int i = 1;
byte b = i; // won't compile
```

# Explicit Type Conversion (Casting)

```csharp
int i = 1;
byte b = (byte) i;
```

# Non-compatible types

```csharp
string s = "1";
int i = (int) s; // won't compile
int i = Convert.ToInt32(s);
int j = int.Parse(s);
```

# Overflowing

```csharp
byte number = 255;
number = number + 1; // -> 0
```

Stop overflowing:

```csharp
checked {
	byte number = 255;
	number = number + 1; // -> exception
}
```
