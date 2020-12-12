# Properties

- unite getter and setter methods

```csharp
class Circle {
	private double rad = 0.0;
	public double Radius { // property
		get { return rad; } // getter
		set { rad = value; } // setter
	}
}
```

```csharp
Circle c = new Circle();
c.Radius = 5.0; // setter called
double r = c.Radius; // getter called
```
