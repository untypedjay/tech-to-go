# Basics

# How to run your JavaScript Code

- in the Chrome Developer Tools Console
- HTML inline with the `<script>` tag (usually before the closing body tag)
- in an external file with `<script src="./some.js"></script>`
- in Node.js by calling the script in the console: `node node-example.js`

# Where to put your JavaScript code

- the HTML standard recommends placing the `<script>` tag within the page head
- if your script is designed to write data to the page, you have to place it within the `<body>` on the exact position where you want the text to appear
- if your script refers to an item on the page, then the script must be placed after that item

→ so usually the JavaScript code will be at the end of the body

```html
	...
	<script src="./scripts/myscripts.js"></scripts>
</body>
```

# When your code gets executed

There are three ways:

- automatically when the page loads
- when your script calls a function
- in response to some event, such as the user clicking a button

# Handling browsers with JavaScript turned off

```html
<noscript>
	<p>Hey, your browser has JavaScript turned off!</p>
	<p>Okay, cool, perhaps you'll prefer this <a href="no-js.html">non-JavaScript version</a> of the page.</p>
</noscript>
```

# First Steps

```js
alert('Hello World');
console.log('Hello World');
console.error('This is an error');
console.warn('This is a warning');

if (confirm("Are you sure about this?") === true) {
	console.log("You clicked OK.");
} else {
	console.log("You clicked Cancel.");
}
```

# Writing Text to the Page

```js
document.write("This page was last modified on " + document.lastModified);
document.write("Copyright " + new Date().getFullYear());
```

# Variables

- `var`: function scoped (visible in entire function), should not be used
- `let`: block scoped (only visible in current block e.g. in an if statement), you can reassign values
- `const`: block scoped; can't be reassigned

```js
var first = 'wes'; // variable declaration
let age = 30;
age = 31;

const score = 10;
```

`'use strict';` does not let you define a variable without the specifier; enforced by default when using modules (which is most common in modern JavaScript)

Variables need to be named with letters underscores and dollar signs.

## Rules

- use `const` by default
- use `let` if you want to change the variable
- almost never use `var`

# Datatypes

## Overview

Mnemonic: SNOB'N'US

- String
- Number
- Object (special, because the only one that is not a primitive)
- Boolean
- Null
- Undefined
- Symbol

```js
const name = 'John'; // string
const age = 30; // number
const rating = 4.5; // number
const isCool = true; // boolean
const x = null; // null
const y = undefined; // undefined
let z; // undefined

console.log(typeof rating);
```

## String

Three ways to write strings:

```js
const name = 'john';
const middle = "peter";
const last = `doe`;
```

Single and double quotes are the exact same thing.

### Escaping

```jsx
const sentence = 'she\'s so cool';
const sentence = "she's so \"cool\"";
```
**Common JavaScript Escape Sequences**
|Escape Sequence|Representing Character|
|:----|:---|
|\'|single quotation mark|
|\"|double quotation mark|
|\b|backspace|
|\f|form feed|
|\n|new line|
|\r|carriage return|
|\t|tab|
|\\\ |backslash|

### Putting Strings on multiple lines

```js
const song = 'Ohhh \
\
ya\
I like\
pizza';

const song = `Ohhh 

ya
I like
pizza`;
```

This is extremely helpful when writing HTML.

### Concatenation & Interpolation

```js
const hello = 'hello my name is ' + name + '. Nice to meet you.';

const hello = `hello my name is ${name}. Nice to meet you. I am ${1 + 100} years old.`;
```

---

```js
var bookName = new String("Web Coding and Development");

// Concatenation
console.log('My name is ' + name + ' and I am ' + age);
// Template String
const hello = `My name is ${name} and I am ${age}`;
console.log(hello);

const s = 'Hello World';
console.log(s.length);
console.log(s.toUpperCase());
console.log(s.toLowerCase());
console.log(s.substring(0, 5).topUpperCase());
console.log(s.split(''));
s.indexOf("H");
s.lastIndexOf("l");
```

## Number

```js
const age = 100.5;
```

### Math

```js
1 + "1"; // concatenation -> 11
20 % 3; // -> 2
"10" * "10"; // -> 100
0.1 + 0.2; // -> 0.30000000000000004
window.location = `https://${0.1 + 0.2}.com`;
10 ** 2; // "to the power of"
1000 ** 200; // -> Infinity
typeof Infinity; // -> "number"
10 / 'dog'; // -> NaN
typeof NaN; // -> "number"
```

Always store prices in whole numbers! Store them for example in cents.

### Helper Methods

```js
Math.round(20.5); // -> 21
Math.round(20.2); // -> 20
Math.floor(20.9); // -> 20
Math.ceil(20.1); // -> 21
Math.random() // -> random number between 0 and 1
Math.max(10, 12); // -> 12
```

### Modulo Operator

```js
const smarties = 20;
const kids = 3;
const eachKidGets = Math.floor(smarties / kids);
const dadGets = smarties % kids;
console.log(`Each kid gets ${eachKidGets}`);
```

## Object

Everything in JavaScript is an object. It's used to group things together.

```js
const person = {
	first: 'john',
	last: 'doe',
	age: 21
};

person.first; // -> "jeff"
```

## Null

Variables that have nothing in it. It has to be set explicitly.

```js
const somethingNull = null;
```

## Undefined

Variables that have no value set yet.

```js
let dog;
console.log(dog); // -> undefined
```

## Boolean

```js
let isDrawing = false;
```

### Equals

`===`: checks both value and type

`==`: checks only the value (bad practice)

```jsx
"10" == 10; // -> true
"10" === 10; // -> false
```

## Symbol
