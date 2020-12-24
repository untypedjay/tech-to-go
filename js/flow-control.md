# Flow Control

## Truthy & Falsy Values
* truthy: `1`, `-10`, `'hello'`, `"0"`, `[]`, `{}`
* falsy: `0`, `undefined`, `null`, `NaN`, `''`

## Loops

```js
// for
for (let i = 0; i < 10; i++) {
	console.log(i);
}

for (let i = 0; i < todos.length; i++) {
	console.log(todos[i].text);
}

// while
let i = 0;
while(i < 10) {
	console.log(i);
	i++;
}

// for of (USE CASES: can handle emojis, promises)
for(let todo of todos) {
	console.log(todo.text);
}

// foreach
todos.forEach(function() {
	console.log(todo.text);
});

```

## Coercion

Forcing something into a real boolean.

```js
const name = 'john';

if (!!name) {
	console.log(name); // true
}
```

## Ternaries

```js
const count = 0;
const word = count === 1 ? 'item' : 'items';

const isAdmin = true;
isAdmin ? showAdminBar() : null;
```

## Conditional Abuse

```js
isAdmin && showAdminBar();
```
