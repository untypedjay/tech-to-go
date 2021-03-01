# Document Object Model (DOM)

By typing `window.location` or `location` you get information about the current location.

The `document` object contains everything in the HTML document.

`innerWidth` gives you the width of your browser window.

`navigator` gives you information about the device.

# Selecting Elements

You can use all kinds of CSS selectors here. You can run `.querySelector()` on every element, not only on the document.

```jsx
const p = document.querySelector('p'); // get first paragraph elements
const itemDivs = document.querySelectorAll('div.item'); // get all div elements with the item class in a node list
// you only need querySelector and querySelectorAll
const footer = document.getElementById('footer');
```

# Element Properties and Methods

```jsx
const heading = document.querySelector('h2');
console.dir(heading); // shows all element properties
console.log(heading.textContent); // gives you everything inside the element
console.log(heading.innerText); // gives you only human readable text and hides hidden elements
heading.textContent = 'Wes is cool'; // change a specific property
heading.textContent = `${heading.textContent} and nice`;
heading.insertAdjacentText('beforeend', 'some text'); // afterbegin, ...
console.log(heading.innerHTML); // passes content as HTML
console.log(heading.outerHTML); // passes content as HTML including parent
```

Learn more about element properties and methods: [https://developer.mozilla.org/en-US/docs/Web/API/Element](https://developer.mozilla.org/en-US/docs/Web/API/Element)

# Working with Classes

```jsx
const pic = document.querySelector('.nice');
pic.classList.add('open');
pic.classList.remove('cool');
pic.classList.contains('open'); // -> true
pic.classList.toggle('open');

pic.addEventListener('click', toggleRound);
```

# Built in and Custom Data Attributes

```jsx
pic.alt = 'Cute Pup'; // no need to say 'a photo of...'
pic.setAttribute('alt', 'REALLY CUTE PUP'); // will also work for non standard attributes
pic.width = 200;

pic.addEventListener('load', function() { // wait until everything gets loaded
	console.log(pic.naturalWidth); // just a getter, cannot be changed
});

console.log(pic.getAttribute('alt'));
```

You should not invent custom attributes, because HTML might add those attributes in the future. If you really need to have data attached to an element, use `data-something` where you can replace `something` with anything you like.

```html
<img data-name="wes" src="https://picsum.photos/200"/>
```

```jsx

custom.addEventListener('click', function() {
	alert(`Welcome ${custom.dataset.name} ${custom.dataset.last}`);
}
```

# Creating HTML

```jsx
const myParagraph = document.createElement('p');
myParagraph.textContent = 'I am a P';
myParagraph.classList.add('special');

const myImage = document.createElement('img');
myImage.src = 'https://picsum.photos/500';
myImage.alt = 'Nice photo';

const myDiv = document.createElement('div');
myDiv.classList.add('wrapper');

myDiv.appendChild(myParagraph);
myDiv.appendChild(myImage);

document.body.appendChild(myDiv);

const heading = document.createElement('h2');
heading.textContent = 'Cool Things';
myDiv.insertAdjacentElement('beforebegin', heading);

const mySecondParagraph = myParagraph.cloneNode(true);
```

# HTML from Strings and XSS (Cross Site Scripting)

```jsx
const item = document.querySelector('.item');
const width = 500;
const src = `https://picsum.photos/${width}`;
const desc = `Cute Pup`;
const myHTML = `
	<div> class="wrapper">
		<h2> ${desc}</h2>
		<img src="${src}" alt="${desc}"/>
	</div>
`;
item.innerHTML = myHTML; // only a string until it's in the DOM

// turn a string into a DOM element before adding it to the DOM
const myFragment = document.createRange().createContextualFragment(myHTML);
document.body.appendChild(myFragment);
```

If you take user input and insert it into your HTML, users could insert any JavaScript, HTML and CSS they want which is a big security hole.

# Traversing and Removing Nodes

## Elements vs Nodes

- everything is a node (even text)
- elements have tags

```jsx
const wes = document.querySelector('.wes');
// element properties (ignore text nodes)
console.log(wes.children);
console.log(wes.firstElementChild);
console.log(wes.lastElementChild);
console.log(wes.previousElementSibling);
console.log(wes.childElementCount);
console.log(wes.nextElementSibling);
console.log(wes.parentElement);

// node properties (do not ignore text nodes)
el.childNodes
el.firstChild
el.lastChild
el.previousSibling
el.nextSibling
el.parentNode

// remove
const p = document.createElement('p');
p.textContent = 'I will be removed';
document.body.appendChild(p);
p.remove(); // removes it from the DOM, could be readded
```

# EXCERCISE

```jsx
// Make a div
const div = document.createElement('div');
// add a class of wrapper to it
div.classList.add('wrapper');
// put it into the body
document.body.appendChild(div);
// make an unordered list
// add three list items with the words "one, two three" in them
const ul = `<ul>
	<li>one</li>
	<li>two</li>
	<li>three</li>
</ul>`;
// put that list into the above wrapper
div.innerHTML = ul;
//create an image
const img = document.createElement('img');
// set the source to an image
img.src = 'https://picsum.photos/500';
// set the width to 250
img.width = 250;
// add a class of cute
img.classList.add('cute');
// add an alt of Cute Puppy
img.alt = 'Cute Puppy!';
// Append that image to the wrapper
div.appendChild(img);
// with HTML string, make a div, with two paragraphs inside of it
const myHTML = `
	<div class="myDiv">
		<p>Paragraph One</p>
		<p>Paragraph Two</p>
	</div>
`;
const ulElement = div.querySelector('ul');
// put this div before the unordered list from above
ulElement.insertAdjacentHTML('beforebegin', myHTML);
// add a class to the second paragraph called warning
const myDiv = div.querySelector('.myDiv');
myDiv.children[1].classList.add('warning');
// remove the first paragraph
myDiv.firstElementChild.remove();
// create a function called generatePlayerCard that takes in three arguments: name, age, and height
function generatePlayerCard(name, age, height) {
	const html = `
		<div class="playerCard">
			<h2>${name} - ${age}</h2>
			<p>Their height is ${height} and ${age} years old. In Dog years this person would be ${age * 7}.
				 That would be a tall dog!</p>
			<button class="delete" type="button">&times; Delete</button>
		</div>
`;
	return html;
}
// make a new div with a class of cards
const cards = document.createElement('div');
cards.classList.add('cards');
// Have that function make 4 cards
let cardsHTML = generatePlayerCard('wes', 12, 150);
cardsHTML = cardsHTML + generatePlayerCard('scott', 12, 150);
cardsHTML += generatePlayerCard('kait', 12, 150);
cardsHTML += generatePlayerCard('snickers', 12, 150);
// append those cards to the div
cards.innerHTML = cardsHTML;
// put the div into the DOM just before the wrapper element
div.insertAdjacentElement('beforebegin', cards);
// put a delete button on each card so when you click it, the whole card is removed
// select all the buttons
const buttons = document.querySelectorAll('.delete');
// make a delete function
function deleteCard() {
	const buttonThatGotClicked = event.currentTarget;
	//buttonThatGotClicked.parentElement.remove(); // or
	buttonThatGotClicked.closest('.playerCard').remove();
}
// loop over them and attach a listener
buttons.forEach(button => button.addEventListener('click', deleteCard));
```
