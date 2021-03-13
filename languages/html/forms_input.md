# Forms and Input

## Forms `<form>`

- action attribute: URL where form data is sent on submit
- method attribute: HTTP method to send data with
    - GET: to ask the server for data, to get data // request body is empty & form data is appended to the URL (key-value pairs), never send sensible data with a GET request
    - POST: to send data to the server // form data is sent via request body

```html
<form action="/action_page.php" method="get">
  <label for="fname">First name:</label>
  <input type="text" id="fname" name="fname"><br>
  <label for="lname">Last name:</label>
  <input type="text" id="lname" name="lname"><br>
  <input type="submit" value="Submit">
</form>
```

### Labels `<label>`

Defines a label for several elements.

- should only be used inside a form
- label will be read out for screen reader users

### Fieldset `<fieldset>`

Groups related elements in a form.

- the `<legend>` tag defines a caption for the `<fieldset>` element

```html
<form action="/action_page.php">
  <fieldset>
    <legend>Personalia:</legend>
    <label for="fname">First name:</label>
    <input type="text" id="fname" name="fname"><br><br>
    <label for="lname">Last name:</label>
    <input type="text" id="lname" name="lname"><br><br>
    <label for="email">Email:</label>
    <input type="email" id="email" name="email"><br><br>
    <label for="birthday">Birthday:</label>
    <input type="date" id="birthday" name="birthday"><br><br>
    <input type="submit" value="Submit">
  </fieldset>
</form>
```

### Built-In Form Validation Attributes

- `required`
- `minlength`, `maxlength`
- `min`, `max`
- `type`
- `pattern`

### Input Types `<input type="">`

- `button`: use it for buttons inside a form
- `checkbox`
- `color`: the user can choose a color
- `date`: a small calendar is opened
- `datetime-local`: like date but the time is included
- `email`: has to meet the formal criteria of an email address
- `file`: opens a file choosing window of your OS
- `hidden`: input is hidden, use if you want to send something like a timestamp
- `image`
- `month`: lets you choose a month and a year
- `number`: only allows numbers
- `password`: input is censored
- `radio`
- `range`: a range slider
- `reset`: a button that resets all other input
- `search`: a search bar
- `submit`: a button that executes the specified action
- `tel`: telephone number
- `text`
- `time`
- `url`
- `week`: lets you choose a week number and a year

### Textarea `<textarea>`

Defines a multi-line text input control.

- always add a `<label>` tag
- should only be used inside forms

```html
<label for="w3mission">W3Schools mission:</label>
<textarea id="w3mission" rows="4" cols="50">
At w3schools.com you will learn how to make a website. We offer free tutorials in all web development technologies.
</textarea>
```

### Drop-Down Controls `<select>`

Creates a drop-down list. Choose this if you want the user to choose an option you give to him.

- always add a `<label>` tag

```html
<label for="cars">Choose a car:</label>
<select id="cars">
  <option value="volvo selected">Volvo</option>
  <option value="saab">Saab</option>
  <option value="opel">Opel</option>
  <option value="audi">Audi</option>
</select>
```

### Datalist `<datalist>`

Specifies a list of pre-defined options for an `<input>` element. Choose this if you make suggestions but the user can type in anything.

- provides an autocomplete feature

```html
<label for="browser-choice">Chooose a browser:</label>
<input list="browsers" id="browser-choice" name="browser-choice"/>

<datalist id="browsers">
  <option value="Internet Explorer">
  <option value="Firefox">
  <option value="Chrome">
  <option value="Opera">
  <option value="Safari">
</datalist>
```

### Group Related Options `<optgroup>`

Group related options in a drop-down list.

- always add a `<label>` tag

```html
<label for="cars">Choose a car:</label>
<select id="cars">
  <optgroup label="Swedish Cars">
    <option value="volvo">Volvo</option>
    <option value="saab">Saab</option>
  </optgroup>
  <optgroup label="German Cars">
    <option value="mercedes">Mercedes</option>
    <option value="audi">Audi</option>
  </optgroup>
</select>
```

### Output `<output>`

Represents the result of a calculation (like one performed by a script).

```html
<form oninput="x.value=parseInt(a.value)+parseInt(b.value)">0
	<input type="range" id="a" value="50">100
	+<input type="number" id="b" value="50">
	=<output name="x" for="a b"></output>
</form>
```

## Button `<button>`

Defines a clickable button.

- you can put content inside like text or images, with the `<input type="button">` you can't
- always specify the type attribute (`button`, `reset`, `submit`)
- inside a form, it behaves as a submit button per default, therefore you should use the `<input type="button">` inside a form
- use it for actions
- for links to different content use `<a>`

```html
<button class="favorite styled" type="button">Add to favorites</button>
```
