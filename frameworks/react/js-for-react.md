# JavaScript for React
## Closures
A closure is a function that reads or modifies the value of a variable defined outside of its lexical context.
They are created every time a function is created, at function creation time.

```js
let count = 1
function counter() {
    console.log(count)
}
counter() // print 1
count = 2
counter() // print 2
```

This can alsy be done using functions, even if the outer function has already been terminated:

```js
function outer() {
	const outerVar = 'Outer';
	function inner() {
		const innerVar = 'Inner';
		console.log(innerVar);
		console.log(outerVar); // look in the scope lookup chain
	}
	return inner;
}

const innerFn = outer(); // innerFn is the inner() now
innerFn();
```

Even the function `outer` is not running anymore (returned), the variables are still available.
For example, this can be useful when we want to keep track of some data that is not available from outside the function:
```js
function createGame(gameName) {
	let score = 0;
	return function win() {
		score++;
		return `Your game ${gameName} score is ${score}`;
	}
}

const hockeyGame = createGame('Hockey');
const soccerGame = createGame('Soccer');
```

## Template Literals
A template literal is created when defining a string using backticks:
```js
const templateLiteral = `I am a template literal`.
```

If you want to use a backtick inside a template literal, you can easily escape it using a backslash before.
Template literals have the ability to span across multiple lines.

Any expression (something that results in a value) can be interplolated in template literals like this:
```js
let firstName = 'John',
    lastName = 'Doe';

let greeting = `Hi ${firstName}, ${lastName}`;
```

## Shorthand Properties
Whenever a variable has the same name as the property on an object, the property name can be omitted:

```js
//
const withoutShorthandProperties: {
  name: name,
  id: id,
  avatar: avatar,
  timestamp: Date.now()
}

const withShorthandProperties: {
  name,
  id,
  avatar,
  timestamp: Date.now()
}
```

## Arrow Functions
Arrow functions are a more concise alternative to function expressions, but there are slight differences.
The main difference is, that arrow functions don't have their own scope, so the bindings of `this` and `super` cannot be used.
Therefore, arrow functions should not be used as methods.

```js
// traditional anonymous function
function (a, b){
  return a + b + 100;
}

// arrow function
(a, b) => a + b + 100;
```

## Destructuring Assignments
The destructuring assignment syntax is a JavaScript expression that makes it possible to unpack values from arrays, or properties from objects, into distinct variables.
### Array Destructuring
```js
let arr = ["John", "Smith"]

let [firstName, surname] = arr;

alert(firstName); // John
alert(surname);  // Smith
```

### Object Destructuring
```js
let options = {
  title: "Menu",
  width: 100,
  height: 200
};

let {title, width, height} = options;

alert(title);  // Menu
alert(width);  // 100
alert(height); // 200
```

## Default Parameters
Parameters are what you specify in the function declaration whereas the arguments are what you pass to the function.
A parameter as a default value of `undefined` if there is no argument passed to the function.
But the default parameter can also be custom:
```js
function say(message='Hi') {
    console.log(message);
}

say(); // 'Hi'
say(undefined); // 'Hi'
say('Hello'); // 'Hello'
```

## Rest/Spread
The rest syntax puts the rest of some user-supplied values into an array. The spread syntax expands iterables (such as arrays and objects) into individual elements.

Rest example:
```js
function myBio(firstName, lastName, ...otherInfo) { 
  return otherInfo;
}

myBio("Oluwatobi", "Sofela", "CodeSweetly", "Web Developer", "Male"); // ["CodeSweetly", "Web Developer", "Male"]
```

Spread examples:
```js
function sum(x, y, z) {
  return x + y + z;
}

const numbers = [1, 2, 3];

console.log(sum(...numbers));
```

```js
let numberStore = [0, 1, 2];
let newNumber = 12;
numberStore = [...numberStore, newNumber];
```

## ES Modules
```js
// default import
import toUpperCase from './uppercase.js'

// default import from different domain
import toUpperCase from 'https://flavio-es-modules-example.glitch.me/uppercase.js'

// named import
import { toUpperCase } from '/uppercase.js'

// named export
export { a, b, c }

// import all epxorts
import * from 'module'

// rename imports
import { a, b as two } from 'module'
```

## Terneries
The conditional (ternary) operator is the only operator in JavaScript that takes three operands: a condition followed by a question mark (`?`), then an expression that will be executed if the condition is truthy, followed by a colon (`:`) and the expression that will be executed if the condition is falsy.

```js
const beverage = (age >= 21) ? "Beer" : "Juice";
```

## Array Methods
### `find`
It returns the value of the first element in the provided array that satifies the provided testing function. If no value satisfies the testing function, `undefined` will be returned.
```js
const foundElement = array1.find(element => element > 10);
```

### `some`
It returns true if there is an element in the array for that the provided function returns true, otherwise false.
```js
const isSomethingEven = array2.some(element => element % 2 === 0);
```

### `every`
It returns true if all elements pass the test implemented by the provided function.
```js
const isAllBelowThreshold = array3.every(element => element < 40);
```

### `includes`
It returns true if a certain value is part of the array.
```js
const includesCat = array4.includes('cat');
```

### `map`
It creates a new array with the results of the provided function being executed on every element.
```js
const multipliedByTwo = array5.map(element => element * 2);
```

### `filter`
It creates a new array with all elements that pass the provided test function.
```js
const longWords = array6.filter(element => element.length > 6);
```

### `reduce`
It passes the return value from the applied function from each element to the next one and returns the final result.
```js
const sum = array7.reduce((previousElement, currentElement) => previousElement + currentElement);
```

## Nullish Coalescing Operator
It returns the first argument if it's not `null` or `undefined`. Otherwise the second one.
```js
const foo = null ?? 'default string'; // -> "default string"
const baz = 0 ?? 42; // -> 0
```

## Optional Chaining
It behaves like the `.` chaining operator. But instead of causing an error if a reference is nullish (`null` or `undefined`), it returns `undefined`.
```js
const dogName = adventurer.dog?.name;
```
