# Datatypes

## Overview
- String
- Number
- BigInt
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
const billion = 1e9;
const ms = 1e-6;
const hex = 0xff; // 255
const bin = 0b11111111; // 255
const oct = 0o377; // 255
alert(bin == oct); // true
alert(isFinite('15')); // true
alert(isFinite('str')); // false
alert(isFinite(Infinity)); // false
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
typeof Infinity; // -> "number", greater than any number, e.g. 1 / 0
10 / 'dog'; // -> NaN
typeof NaN; // -> "number", result of a computational error
```

Always store prices in whole numbers! Store them for example in cents.

### Helper Methods

```js
Math.round(20.5); // -> 21
Math.round(20.2); // -> 20
Math.floor(20.9); // -> 20
Math.ceil(20.1); // -> 21
Math.trunc(3.1); // -> 3.1
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

## BigInt
The number type cannot hold larger integer values than 9007199254740991.
For certain purposes e.g. for cryptography it is useful to have number that are bigger than that.
`BigInt` can hold integers of arbitrary length.
```js
// the "n" at the end means it's a BigInt
const bigInt = 1234567890123456789012345678901234567890n;
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
typeof null; // -> "object", which is an error and kept for compatibility reasons
```

## Undefined

Variables that have no value set yet.
Variables should not explicitly assigned to `undefined`.

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
This type is used to create unique identifiers for objects.
Object property keys may be eigher a string or a symbol.
```js
let id1 = Symbol();
let id2 = Symbol('id'); // add a description
alert(id2.description); -> id
```
Symbols cannot be auto-converted to a string. If you try to `alert` a symbol it will throw an error. It only works using the `.toString()` method.

Symbols allow us to create hidden properties of an object, that no other part of code can accidentally access or overwrite.
```js
let user = {
	name: 'John'
};

let id = Symbol('id');
user[id] = 1;
alert(user[id]);
```
That is safer than an id property because third-party code won't notice the symbol and can even add their own.
There will be no conflict because symbols are always different, even if they have the same name.

### Symbols in an object literal
```js
let id = Symbol('id');

let user = {
	name: 'John',
	[id]: 123
};
```

Symbols are skipped by `for...in` and are ignored by `Object.keys(user)`.
`Object.assign()` copies both string and symbol properties.
