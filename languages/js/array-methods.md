# Array Methods

```jsx
map([🐮, 🥔, 🐔, 🌽], cook)
	=> [🍔, 🍟, 🍗, 🍿]

filter([🍔, 🍟, 🍗, 🍿], isVegetarian)
	=> [🍟, 🍿]

reduce([🍔, 🍟, 🍗, 🍿], eat)
	=> 💩
```

# Map

The `map()` method creates a new array populated with the results of calling a provided function on every element in the calling array.

```jsx
const array1 = [1, 4, 8, 18];
const map1 = array1.map(x => x * 2);
```

# Filter

The `filter()` method creates a new array with all elements that pass the test implemented by the provided function.

```jsx
const words = ['spray', 'limit', 'elite', 'exuberant', 'destruction', 'present'];
const result = words.filter(word => word.length > 6);
```

# Sort

The `sort()` method sorts the elements of an array per default in ascending order.

```jsx
const months = ['March', 'Jan', 'Feb', 'Dec'];
months.sort();
```

# Reduce

The `reduce()` method executs a reducer function on each element of the array, resulting in a single output value.

```jsx
const reducedVal = [1, 2, 3, 4, 5].reduce(function(accumulator, current) {
	return accumulator + current;
});
```

# Every

The `every()` method tests whether all elements in the array pass the test implemented by the provided function. It returns a Boolean value.

```jsx
const array1 = [1, 30, 39, 29, 10, 13];
console.log(array1.every((currentValue) => currentValue < 40));
```

# Some

The `some()` method tests whether at least one element in the array passes the test implemented by the provided function. It returns a Boolean value.

```jsx
const array1 = [1, 30, 39, 29, 10, 13];
console.log(array1.some((element) => element % 2 === 0));
```

# Find

The `find()` method returns the value of the first element in the provided array that satisfies the provided testing function

```jsx
const array1 = [5, 12, 7, 112, 44];
const found = array1.find(element => element > 10);
```

# FindIndex

The `findIndex()` method returns the index of the first element in the array that satisfies the provided testing function. Otherwise, it returns `-1`.

```jsx
const array1 = [5, 12, 7, 112, 44];
const foundIndex = array1.findIndex(element => element > 10);
```

# Splice

The `splice()` method can insert, remove and replace elements from an array.

```jsx
arr.splice(1, 1); // from index 1 remove 1 element
arr.splice(0, 3, 'new', 'new2'); // remove first 3 elements and replace them with another
arr.splice(2, 0, 'new', 'new2'); // insert two elements on index 2
```
