# Basics

# How to run your JavaScript Code
JavaScript can run on every device that has a JavaScript engine.
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
