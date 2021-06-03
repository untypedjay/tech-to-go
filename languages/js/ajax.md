# AJAX

- Asynchronous JavaScript & XML
- Set of web technologies
- send & receive data asynchronously
- usually JSON
- `XmlHttpRequest` (XHR) Object

# Get a Text File

```jsx
function getText() {
	// create XHR object
	let xhr = new XMLHttpRequest();
	// OPEN - type, url/file, async
	xhr.open('GET', 'sample.txt', true);

	xhr.onload = function() {
		if (this.status == 200) {
			console.log(this.responseText);
		}
	}

	// send request
	xhr.send();
}
```

# Get Local JSON

```jsx
function getUser() {
	let xhr = new XMLHttpRequest();
	xhr.open('GET', 'user.json', true);

	xhr.onload = function() {
		if (this.status == 200) {
			console.log(JSON.parse(this.responseText));
		}
	}

	xhr.send();
}
```

# Get Data From External API

```jsx
function getUsers() {
	let xhr = new XMLHttpRequest();
	xhr.open('GET', 'https://api.github.com/users', true);

	xhr.onload = function() {
		if (this.status == 200) {
			console.log(JSON.parse(this.responseText));
		}
	}

	xhr.send();
}
```

# Get Data From PHP Server

```jsx
function getName(e) {
	e.preventDefault();

	let xhr = new XMLHttpRequest();
	xhr.open('GET', `process.php?name={name}`, true);

	xhr.onload = function() {
		if (this.status == 200) {
			console.log(this.responseText);
		}
	}

	xhr.send();
}
```

# Send Data To PHP Server

```jsx
function setName(e) {
	e.preventDefault();

	let xhr = new XMLHttpRequest();
	xhr.open('POST', 'process.php', true);
	xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');

	xhr.onload = function() {
		if (this.status == 200) {
			console.log(this.responseText);
		}
	}

	xhr.send();
}
```
