# Functions

# Built-in Functions

```jsx
parseFloat('20.345'); // -> 20.345
parseInt('20.354'); // -> 20
Date.now(); // time in milliseconds since a specific date; convert with https://epoch.now.sh/
scrollTo({ top: 600, left: 0, behaviour: 'smooth' });
navigator.vibrate(200)
```

# Custom Functions

```jsx
// function definition
function calculateBill(billAmount, taxRate) {
	// function body
	console.log('Running calculateBill()');
	const total = billAmount * taxRate;
	return total;
}

// function call
const myTotal = calculateBill(100, 1.13);
console.log(`Your Total is $${myTotal}`);
console.log(`Your Total is $${calculateBill(100, 1.13)}`);
```

## Default Parameters

```jsx
function yell(name = 'Jeremy Bezos') {
	return `HEY ${name.toUpperCase()}`;
}

yell('Heey');
yell();
```

When you have multiple default parameters and you don't want to default them all you have to use `undefined` for the parameters you want to default.

# Ways to declare Functions

## Function Keyword

Can be called before the definition (hoisting).

```jsx
function doctorize(firstName) {
	return `Dr. ${firstName}`;
}
```

## Anonymous Functions

Just this function is not a valid code. Used for example in Callbacks or IIFEs.

```jsx
function(firstName) {
	return `Dr. ${firstName}`;
}
```

## Function Expression

- can't be called before the definition (no hoisting)
- they avoid polluting the global namespace

Almost never used.

```jsx
const doctorize = function(firstName) {
	return `Dr. ${firstName}`;
};

doctorize('wes');
```

## Arrow Functions

Benefits:

- they are shorter
- don't have their own scope in refer to the `this` keyword

Arrow Functions are anonymous functions.

Should not be used:

- in object methods
- in callback functions with dynamic context
- when it makes your code less readable

Arrow functions shine best with anything that requires `this` to be bound to the context, and not the function itself.

```jsx
const inchToCM = inches => { return inches * 2.54; }; // explicit return
const inchToCM = (inches) => inches * 2.54; // implicit return

const add = (a, b = 3) => a + b;

const makeABaby = (first, last) => ({ name: `${first}, ${last}`, age: 0 });
```

## Immediately Invoked Function Expression (IIFE)

```jsx
(function(age) {
	console.log('Running the anon function');
	return `You are cool and age ${age}`;
})(10);
```

## Methods

A method is a functions that lives inside of an object.

```jsx
const wes = {
	name: 'Kim Anderson',
	sayHi: function() {
		console.log(`Hey ${this.name}`);
		return 'Hey Wes';
	},
	// most common
	yellHi() {
		console.log('HEY KIM!');
	},
	// Arrow function, only use when you don't want to access "this"
	whisperHi: () => {
		console.log('hii wess im a mouse');
	}
}
```

## Callback Functions

### Click Callback

```html
<button class="js-click-me">Click Me!</button>
```

```jsx
const button = document.querySelector('.js-click-me');
button.addEventListener('click', wes.yellHi);
button.addEventListener('click', function() {
	console.log('Nice Job!');
});
```

### Timer Callback

```jsx
setTimeout(wes.yellHi, 1000); // wait 1 second and then run it
setTimeout(function() {
	console.log('DONE! Time to eat!');
}, 1000);
```

# Connecting a Function to a Button

```html
<button onclick="makeBackgroundRed()"></button>
```
