# Parameters

# Input Parameters (Value)

```csharp
int Succ(int i)
{
	return i + 1;
}
```

# Crossover Parameters (Reference)

- actual parameter needs to be initialized

```csharp
void Inc(ref int i)
{
	i = i + 1;
}

Inc(ref n);
```

# Output Parameters

- actual parameter does not have to be initialized (cannot be a rvalue)

```csharp
void Concat(string a, string b, out string ab)
{
	ab = a + b;
}

Concat("hello", "world", out result);
```

# Optional Parameters

```csharp
double Sum(params double[] values) {
	double sum = 0;
	foreach (double val in values) {
		sum += val;
	}
	return sum;
}
```

```csharp
double sum = Sum(1, 2, 3, 4);

double[] arr = {1, 2, 3, 4};
double sum = Sum(arr);
```
