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
