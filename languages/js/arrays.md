# Arrays

An array is just an object.

```js
const names = ['wes', 'kait', 'snickers'];
const numbers = new Array(1, 2, 3, 4, 5);
for (let n of numbers) {
	console.log(n);
}
numbers.forEach(function(n, i) {
	console.log(i + ' - " + n);
});
const fruits = ['apples', 'oranges', 'pears', 10, true];
fruits[3] = 'grapes';
fruits.push('mangos');
fruits.unshift('strawberries'); // insert at the beginning
var myString = fruits.pop();
console.log(fruits[1]);
console.log(Array.isArray(fruits);
console.log(fruits.indexOf('oranges'));

for (var counter = 0; counter < dogPhotos.length; counter++) {
	dogPhotos[counter] = 'dog-' + (counter + 1);

var array3 = array1.concat(array2);
var string1 = array1.join(' ');
myArray.reverse(); // reverse the order, mutable method
const pizzaslice = numbers.slice(2, 4); // make a new array, immutable
var myString = myArray.shift(); // remove first element
myArray.sort();

// use a mutable method to be immutable
const numbersReversed = [...numbers].reverse();

const anna = names[0];
const mariana = names[0];
const joe = names[0];

const [anna, mariana, joe] = names;

```
