# Fundamentals

# Hello World

```csharp
using System;

namespace HelloWorld {
	class Program {
		static void Main(string[] args) {
			Console.WriteLine("Hello World!");
		}
	}
}
```

# Variables / Constants

Variable: a name given to a storage location in memory

Constant: an immutable value

```csharp
int number;
int Number = 1;
const float Pi = 3.14f;
readonly Pen defaultPen; // initialization only in declaration or constructor
```

# Identifiers

- cannot start with a number
- cannot include whitespace
- cannot be a reserved keyword
- should be meaningful names

# Naming Conventions

- local variables: camelCase
- constants, methods, namespaces, classes, ...: PascalCase
