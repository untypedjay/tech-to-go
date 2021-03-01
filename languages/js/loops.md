# Loops

# forEach

```jsx
// looping through an array
toppings.forEach(topping => {
	console.log(topping);
});
```

# for

```jsx
for (let i = 0; i <= 10; i++) {
	console.log(i);
}
```

# for of

Looping over iterables.

```jsx
const name = 'John';
for (const letter in name) {
	console.log(letter);
}
```

# for in

Looping over keys of an object.

```jsx
const wes = {
	age: 100,
	cool: true
}

for (const prop in wes) {
	console.log(prop);
}
```

# while

```jsx
while() {
	let cool = true;
	while (cool === true) {
		console.log('You are cool');
	}
}
```
