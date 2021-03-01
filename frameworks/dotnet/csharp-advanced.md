# C# Advanced

## Features
### Characteristics of Java
* OOP: inheritance, dynamic binding, interfaces
* meta information
* exception handling
* static typing
* garbage collection

### Characteristics of C++
* operator overloading
* pointer

### New Characteristics
* call by reference (ref and out parameters)
* value types (structs)

## Types
Value types are stored on the stack, reference types on the heap.

### Value Types
Default value is 0, '\0' or false. Copied by value at assignments.
* simple type
* enumeration
```csharp
enum Day:byte { Sun=1, Mon, Tue, Wed, Thu, Fri, Sat };
Day d = Day.Sat;
Console.WriteLine("day = {0}", d); // -> day = Sat
```
* struct
```csharp
struct Color {
  public byte r, g, b;
  public Color(byte r, byte g, byte b) {
    this.r = r; this.g = g; this.b = b;
  }
}

Color black = new Color();
Color yellow = new Color(255, 255, 0);
yellow.r = 200;
```

### Reference Types
Default value is null. Copied by reference at assignments.
* interface type
* pointer type
* array type
* class type
* delegate

### Boxing
Converting a value type into a reference type is called boxing.
* implicit, if an object is needed
```csharp
string s = 123.ToString();
```
### Unboxing
Converting a reference type into a value type is called unboxing.
* explicit using a cast
```csharp
int i = 123;
object o = i; // boxing
int j = (int) o; // unboxing
```

### Nullable Types
* value types that can hold the value `null`
```csharp
public struct Nullable<T> where T : struct {
  public Nullable(T value);
  public bool HasValue { get; }
  public T Value { get; } 
}

int? i1 = 10; // implicit conversion
int? i2 = null; // implicit conversion
int j1 = i1.Value; // j1 == 10
int j2 = (int) i1; // j2 == 10
int j3 = i2 ?? ß; // j3 == 0
```

## Classes
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
Content of a class:
* constants
* arrays
* constructors and destructor
* methods
* operators
* properties
* indexers
* events
* static constructor
* (inner) types

## Visibility Attributes
|Modifier|Scope|
|:--------|:-------|
|`public`|everywhere|
|`protected`|declaring/derived classes|
|`internal`|same assembly|
|`protected internal`|protected OR internal|
|`private protected`|protected AND internal|
|`private`|declaring class|

**Default Value**
|||
|:------|:--------|
|methods/arrays|`private`|
|outer type definitions|`internal`|
|inner type definitions|`private`|
|interface methods|`public`|
|enumeration constants|`public`|

## `IDisposable`
Provides a mechanism for releasing unmanaged resources (explicit by user).
```csharp
public class A : IDisposable {
  ~A() {
    Dispose();
  }
  public void Dispose() {
    // releasing resources
    GC.SuppressFinalize(this);
  }
}
```
Usage:
```csharp
A a = null;
try {
  a = new A();
  ...
} finally {
  a?.Dispose();
}
```
OR
```csharp
using (A a = new A()) {
  ...
} // calls a.Dispose();
```

## Parameters
### Call by Value
```csharp
int Twice(int m) { return 2 * m; }
m = 5; n = Twice(m); // m == 5, n == 10
```

### `ref` Parameters
* needs to be initialized
```csharp
void Twice(ref int n) { n *= 2; }
n = 4; Twice(ref n); // n == 10
```

### `out` Parameters
* does not need to be initialized
```csharp
void Twice(int m, out int n) { n = 2*m; }
m = 5; Twice(m, out n); // m == 5, n == 10
```

## Properties
```csharp
class Circle {
  private double rad = 0.0;
  public double Radius {
    get { return rad; }
    set { rad = value; }
  }
}
```
```csharp
Circle c = new Circle();
c.Radius = 5.0; // setter called
double r = c.Radius; // getter called
```

## Indexers
* access an element in a collection with the index operator
```csharp
class BirthdayList {
  public DateTime this[string name] {
    get { return GetBirthDay(name); }
    set { SetBirthDay(name, value); }
  }
}
```
```csharp
BirthdayList bList = new BirthdayList();
bList["Huber"] = new DateTime(1985, 04, 24);
Console.Write("Birthday: {0}", bList["Huber"]);
```

## Overriding with `override`
```csharp
class A {
  public virtual void F() {
    ...
  }
}
class B : A {
  public override void F() {
    ...
  }
}
```
```csharp
public static void Main() {
  A a1 = new A();
  A a2 = new B();
  B b = new B();
  
  a1.F(); // A.F()
  a2.F(); // B.F()
  b.F(); // B.F()
}
```

## Overriding with `new`
* a method declared with `new` is independent of the base class method
* solves Fragile Base Class Problem (interchangeability)
```csharp
class A {
  public virtual void F() {}
  public void G() {}
  public virtual void H() {}
}
class B : A {
  public new void F() {}
  public new virtual void G() {}
  public override void H() {}
}
class C : B {
  public override void G() {}
  public new virtual void H() {}
}
```
```csharp
static void Main() {
  A a1 = new B();
  a1.F(); // A.F()
  a1.G(); // A.G()
  a1.H(); // B.H()
  
  A a2 = new C();
  a2.F(); // A.F()
  a2.G(); // A.G()
  a2.H(); // B.H()
  
  B b = new C();
  b.F(); // B.F()
  b.G(); // C.G()
  b.H(); // B.H()
}
```

## Extensions
### Object Initializer
```csharp
Employee empl = new Employee { Id = 1, Name = "Musk", City = "Los Angeles" };
```

### Local Variable Type Interface
```csharp
var empls = new List<Employee>() { ... }
```

### Anonymous Types
* classes where the interface is defined at object creation time
```csharp
var obj = new { Id = 1, Name = "Musk" };
```

### Lambda Expressions
```csharp
public delegate bool Predicate<T>(T obj);
private static IEnumerable<T> FilterWhere(IEnumerable<T> numbers, Predicate<T> filter) {
  foreach (T n in numbers)
    if (filter(n))
      yield return n;
}
```
```csharp
var oddNumbers = FilterWhere(numbers, n => n % 2 != 0);
```

### Extension Methods
```csharp
namespace EnumeratorExt {
  public static class Enumerator {
    public static int Sum(this IEnumerable<int> numbers) {
      int sum = 0;
      foreach (int i in numbers) sum += i;
      return sum;
    }
  }
}
```
```csharp
using EnumeratorExt;
var numbers = new List<int> { 2, 3, 5, 7 };
int s = numbers.Sum();
```

### Language Integrated Query (LINQ)
```csharp
using System.Linq;
IEnumerable<Employee> employees = ...;
var query = from e in employees
              where e.City === "Linz"
              select new { Id = e.Id, Name = e.Name };
```
```csharp
var query = employees.Where(e => e.City == "Linz")
                     .Select(e => new { Id = e.Id, Name = e.Name });
```

### Co- and Contravariance
* given. two types U and V with a < relation
> Example 1: int < float < double

> Example 2: V < U, if V is a sub class of U

* let f be a function that maps U to another type U'
> Example 1: T -> IEnumerable<T>
  
> Example 2: T -> T[]
  
Let V < U. Then
* f is covariant if f(V) < f(U)
* f is contravariant if f(U) < f(V)
* f is invariant if f is neighter covariant nor contravariant

Examples:
* T -> T[] // covariant
* T -> GenericInterface<out T> // covariant
* T -> GenericInterface<in T> // contravariant
* T -> delegate T D() // covariant
* T -> delegate void D(T t) // contravariant

## Delegates & Events
```csharp
delegate void UpdateCallback(Args a);

class Subject {
  public event UpdateCallback Observers;
  
  public void Notify(Args a) {
    Observers?.Invoke(a);
  }
}
```
```csharp
class Observer {
  public static void StaticUpdate(Args a) {
    ...
  }
  
  public void Update(Args a) {
    ...
  }
}
```
```csharp
Subject s = new Subject();
Observer o = new Observer();
s.Observers += o.Update;
s.Observers += Observer.StaticUpdate;
s.Notify(new Args());
```
