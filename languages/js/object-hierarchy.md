# The JavaScript Object Hierarchy
```
Array
Date
Math
Number
String
window
├── document
│   ├── anchor
│   ├── form
│   │   ├── button
│   │   ├── checkbox
│   │   ├── password
│   │   ├── radio
│   │   ├── select
│   │   ├── submit
│   │   ├── text
│   │   └── textarea
│   ├── image
│   └── link
├── frame
├── history
└── location
```

## Window Object

- `document`: Refers to whatever document is currently loaded in the browser window.
- `frame`: Represents a frame (if any) that's used to display multiple pages in the browser window. For example, you can use this object to display a different page inside a particular frame.
- `history`: Represents an item in the list of pages that the user has visited in the current browser session. One common use for this object is to send the user back to the page she was on before coming to the current page.
- `location`: Represents the address of the page that's displayed in the browser. You can use this object to determine the current address, send the user to a different address, refresh the browser display, and more.

### Useful Properties of the Window Object

- `console`: Returns a reference to the `console` object, which you use to log text to the console with `console.log()`.
- `document`: Returns a reference to the `document` object (that is, the web page) contained in the window.
- `frames`: Returns a reference to the frames (if any) that are used to display multiple pages in the browser window.
- `history`: Returns a reference to the list of pages that the user has visited in the current browser session. Your code can navigate these pages- for example, by calling the `back()` method to go back one page - but your code can't access the URLs of these pages.
- `innerHeight`: Returns the height, in pixels, of the browser window viewport.
- `innerWidth`: Returns the width, in pixels, of the browser window viewport.
- `localStorage`: Returns a reference to the `localStorage` object, which you can use to store and retrieve data in the browser indefinitely.
- `location`: Returns a reference to the `location` object, which contains info about the current web page URL.
- `navigator`: Returns a reference to the `navigator` object, which provides data on the browser application the visitor is using.
- `scrollX`: Returns the distance, in pixels, that the window's document has been scrolled horizontally.
- `scrollY`: Returns the distance, in pixels, that the window's document has been scrolled vertically.
- `sessionStorage`: Returns a reference to the `sessionStorage` object, which you can use to store and retrieve data in the browser temporarily (that is, the data gets deleted automatically when the user shuts down the current browser session).

### Document Object

- `anchor`: Represents an achor in the document, created using the `<a id>` tag. For example, you can use this object to check if a document contains an anchor that uses a particular name.
- `form`: Represents a form in the document, created with the `<form>` tag. You can use this object to work with all the various form controls, as well as to submit a form.
- `image`: Represents an image in the document, created using the `<img>` tag. You can use this object to change the image that's displayed within a particular `<img>` tag.
- `link`: Represents a link in the document, created using the `<a href>` tag. You can gather information about a link (such as its address) and you can handle events such as the user clicking a link.

#### Working with Elements

```js
document.getElementById("my-div");
document.getElementByTagName("div");
document.getElementsByClassName("keyword");
document.querySelectorAll("article > section");

newArticle = createElement("article");
document.querySelector("main").appendChild(newArticle);
newArticle.innerHTML = "Hello <code>document</code> Object World!";
newArticle.style.fontSize = "64px";
newArticle.classList.add("new-article");
```
