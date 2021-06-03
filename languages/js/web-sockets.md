# Web Sockets

- full-duplex bi-directional communication
- a HTTP upgrade
- only sends headers once
- polling: sending an AJAX request every x seconds (workaround for WebSockets)
- long polling: keep connection open until new data comes (workaround for WebSockets)
- library: socket.io

# Client-Side Implementation

```jsx
const socket = new WebSocket('ws://localhost:8000');

socket.onopen = event => {
	socket.send('Connection is open');
});

socket.onMessage = event => {
	// message from server
	console.log(event.data);
});
```
