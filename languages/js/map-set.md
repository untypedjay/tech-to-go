# Map & Set

# Map

The order in a map is guaranteed.

```jsx
const myMap = new Map();
myMap.set('name', 'wes'); // key, value
myMap.set(100, 'This is a number'); // any type into key and value
console.log(myMap.get(name));
myMap.size;
for (const item of myMap) {
	console.log(item);
}
myMap.get('name');
myMap.has('name');
myMap.delete('name');
myMap.clear();
```

# WeakMap

A map where the keys need to be objects.

# Set

Each value may occur only once.

```jsx
let set = new Set();

let john = { name: "John" };
let pete = { name: "Pete" };
let mary = { name: "Mary" };

// visits, some users come multiple times
set.add(john);
set.add(pete);
set.add(mary);
set.add(john);
set.add(mary);

// set keeps only unique values
alert( set.size ); // 3

for (let user of set) {
  alert(user.name); // John (then Pete and Mary)
}
```

# WeakSet

A set where the keys need to be objects.
