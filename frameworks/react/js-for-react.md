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
