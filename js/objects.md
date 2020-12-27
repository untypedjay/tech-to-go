# Objects

Objects are used when the order does not matter. The last comma is not necessary but you should use it. There can be spaces and dashes in the properties if you put it between quotes

# Object Literals

```jsx
// const just means that the binding to the object cannot be changed
const age = 40;
const person = {
	firstName: 'John',
	lastName: 'Doe';
	'cool-dude': true,
	age, // when property and value is the same -> age: age,
	hobbies: ['music', 'movies', 'sports'],
	address: {
		street: '50 main st'.
		city: 'Boston',
		state: 'MA',
	},
	sayHello(greeting = 'Hey') {
		return `${greeting} ${this.name}`;
	},
	sneeze: () => {
		console.log('Ahhh Chooo', this); // this == window
};

console.log(person.firstName, person['lastName']);
console.log(person.hobbies[1]);
console.log(person.address.city);
console.log(Object.keys(person));
console.log(Object.values(person));

const { firstName, lastName, address: { city }} = person; // destructuring

// add a new property
person.email = 'john@gmail.com';

// delete a property
delete wes.job;

const todos = [
	{
		id: 1;
		text: 'Take out trash',
		isCompleted: true
	},
	{
		id: 2;
		text: 'Meeting with boss',
		isCompleted: true
	},
	{
		id: 3;
		text: 'Dentist appt',
		isCompleted: false
	}
];

console.log(todos[1].text);

// get all values from an object
console.log(Object.values(todos));

const todoJSON = JSON.stringify(todos);
console.log(todoJSON);
```

## Computed Properties
```js
let bag = {
  [fruit]: 5
};
```

# Object Reference vs. Values

Objects and Arrays are pointed to references!

```jsx
let name1 = 'wes';
let name2 = 'wes';

console.log(name1 === name2); // type? yap, value? yap -> true
name1 = 'scott';
console.log(name1 === name2); // false
name1 = name2; // value is copied
console.log(name1 === name2); // true

const person1 {
	first: 'wes',
	last: 'bos',
}

const person2 {
	first: 'wes',
	last: 'bos',
}

console.log(person1 === person2); // false (reference)
const person3 = person1;
person3.first = 'Larry';
console.log(person1.first); // -> Larry (reference)
```

## Spread Operator

Spreads allow you to make a shallow copy (by value) on the first level. This also works for arrays.

```jsx
const person3 = { ...person1 }; // copy by value (one level deep)
person3.first = 'Larry'; // person1 not affected
person3.clothing.shirts = 100; // person1 has now also 100 shirts

// create a new object from other objects
const inventory = { ...meatInventory, ...veggieInventory, }; // same properties get overwritten
```

Libraries like Lodash let you make a real copy.

Include that by going to [unpkg.com/lodash](http://unpkg.com/lodash) and it will automatically find the latest version. Link to it before your custom JavaScript.
