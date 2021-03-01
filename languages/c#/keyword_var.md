# The Keyword `var`

When using the keyword `var` the compiler automatically detects the data type. When dealing with numbers the default is integer.

```csharp
var totalPrice = 20.95f;
var empls = new ListyEmployee>() { ... }
```
* should only be used if it is obvious or an anonymous type

Example for anonymous type:
```csharp
var obj = new { Id = 1; Name = "John" };
```
