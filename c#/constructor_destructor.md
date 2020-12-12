# Constructor

# Destructor

- called before the Garbage Collection releases an object

```csharp
public class A {
	~A() {
		// release resources like open files
	}
}
```

## IDisposable

- an interface for explicit resource releases

```csharp
public class A : IDisposable {
	~A() {
		Dispose();
	}

	public void Dispose() {
		// release resources like open files
		GC.SuppressFinalize(this);
	}
}
```

```csharp
A a = null;
try {
	a = new A();
	...
} finally {
	a?.Dispose();
}
```

```csharp
using (A a = new A()) {
	...
} // a.Dispose() gets called
```
