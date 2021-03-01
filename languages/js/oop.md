# Object Orientated Programming

# The `new` Keyword

It creates an instance of something. When you use the `new` keyword on a function, it creates a new object instance of that function.

```jsx
// myDate is an object and an instance of Date
const myDate = new Date('August 11, 2025');
// names is an object and an instance of Array
const names = ['wes', 'kait']; // same as new Array('wes', 'kait')

function Pizza(toppings = [], customer) {
	console.log('Making a pizza');
	// save the toppings that were passed in, to this instance of pizza
	this.toppings = toppings;
	this.customer = customer;
	this.id = Math.floor(Math.random() * 16777215).toString(16);
}

const pepperoniPizza = new Pizza();
console.log(pepperoniPizza); // prints the function
console.log(pepperoniPizza.constructor); // prints the function which made it
console.log(pepperoniPizza instanceof Pizza);
```

# The `this` Keyword

Refers to the instance of an object that a function is bound. It is what is on the left side of the dot when you call a method.

Arrow functions don't use the context of what is left of the dot. They refer to one level higher.

```jsx
function tellMeAboutTheButton() {
	console.log(this); // the button that was clicked
}

button1.addEventListener('click', tellMeAboutTheButton); // prints the button
```

# Prototypes

Never put functionality into the instances. Use a prototype to speed up performance.

```jsx
function Pizza(toppings = [], customer) {
	this.toopings = toppings;
	this.customer = customer;
	this.size = 'medium';
}

Pizza.prototype.eat = function () {
	console.log('CHOMP CHOMP CHOMP');
}

Pizza.prototype.size = 'large';

const pepperoniPizza = new Pizza(['pepperoni', 'onion'], 'Wes Bos');
pepperoniPizza.eat();
console.log(pepperoniPizza.size); // -> medium (first lookup on instance, then on protopye)
```

# Classes

```jsx
class Animal {
	constructor(name, age) {
		this.name = name;
		this.age = age;
	}

	static iAmAStaticMethod() {
		console.log('i am static');
	}
	
	eat() {
		console.log(`${this.name} is eating`);
	}
}

const bobby = new Animal('bobby', 2);
bobby.eat();
Animal.IAmAStaticMethod();

class Dog extends Animal {
	constructor(name, age, breed) {
		super(name, age);
		this.breed = breed;
	}

	logBreed() {
		console.log(this.breed);
	}

	dogEats() {
		super.eat();
	}
}
```
