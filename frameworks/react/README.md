# React
React is a JavaScript library for building user interfaces.

## Introduction
* from Facebook
* Open Source

npx create-react-app my-app --template typescript
### Hello World
```js
ReactDOM.render(
  <h1>Hello, world!</h1>,
  document.getElementById('root')
);
```
## JSX
JSX is a syntax extension to JavaScript to describe what the UI should look like. It produces React elements that will be rendered to the DOM. It is not required in order to use React, but is usually easier to visualize the UI in that way.
* can be nested
* children without content should use the self closing tag
* input is safe from injection attacks

### Embedded Expressions
* any valid JavaScript expression can be put between curly brances in JSX
```js
const name = 'Elon Musk';
const element = <h1>Hello, {name}</h1>;

ReactDom.render(
   element,
   document.getElementById('root');
);
```

### JSX are Expressions
```js
function getGreeting(user) {
   if (user) {
      return <h1>Hello, {formatName(user)}!</h1>;
   }
   return <h1>Hello, stranger.</h1>;
}
```

### JSX Attributes
* camelCase
* class -> className
* tabindex -> tabIndex
* for -> htmlFor
* aria attributes stay in kebab-case
```js
const element = <div tabIndex="0"></div>;
const element = <img src={user.avatarUrl}></img>;
```
* strings in double quotes
* any other expression in curly braces

### Internal Representation
```js
const element = (
  <h1 className="greeting">
    Hello, world!
  </h1>
);
```

```js
const element = React.createElement(
  'h1',
  {className: 'greeting'},
  'Hello, world!'
);
```

## React Elements
* these objects are called React elements
* an element describes what you want to see on the screen
* are unlike the DOM cheap to create
* immutable like a single frame in a movie: UI representation at a certain point in time
* only way to update the UI is to create a new element and pass it to `ReactDOM.render()`

```js
function tick() {
  const element = (
    <div>
      <h1>Hello, world!</h1>
      <h2>It is {new Date().toLocaleTimeString()}.</h2>
    </div>
  );
  ReactDOM.render(element, document.getElementById('root'));}

setInterval(tick, 1000);
```

### DOM Updates
* ReactDOM compares the element to the previous one and onlly applies that stuff that changed

## Components
```js
function Welcome(props) {
  return <h1>Hello, {props.name}</h1>;
}
```

```js
class Welcome extends React.Component {
  render() {
    return <h1>Hello, {this.props.name}</h1>;
  }
}
```

```js
const element = <Welcome name="Sara" />;ReactDOM.render(
  element,
  document.getElementById('root')
);
```
1. call `ReactDOM.render()` with the component as an element
2. React calls the component with the props
3. component returns a React element
4. React DOM efficiently updates the DOM

* components always start with a capital letter
* lower case letters are reserved for DOM tags

### Function Components
* accept a single `props` argument
* return a React element

### Class Components
* extend `React.Component`
* has a `render()` method that returns a React element

### Composing Components
```js
function Welcome(props) {
  return <h1>Hello, {props.name}</h1>;
}

function App() {
  return (
    <div>
      <Welcome name="Sara" />
      <Welcome name="Cahal" />
      <Welcome name="Edite" />
    </div>
  );
}

ReactDOM.render(
  <App />,
  document.getElementById('root')
);
```

## Props
* read only (pure functions)

```js
function Welcome(props) {
  return(
    <h1>Welcome {props.name}</h1>
  );
}
```

```js
class Welcome extends React.Component {
  constructor(props) {
    super(props);
  }
  
  render() {
    return(
      <h1>Welcome{this.props.name}</h1>
    );
  }
}
```

## State
* component rerenders when state changes
```js
class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = {date: new Date()};
  }

  render() {
    return (
      <div>
        <h1>Hello, world!</h1>
        <h2>It is {this.state.date.toLocaleTimeString()}.</h2>
      </div>
    );
  }
}
```

## Lifecycle Methods
### `componentDidMount()`
* runs after the component output has been rendered to the DOM
```js
  componentDidMount() {
    this.timerID = setInterval(
      () => this.tick(),
      1000
      );
   }
```

### `componentDidUpdate()`


### `componentWillUnmount()`
```js
 componentWillUnmount() {
    clearInterval(this.timerID);
 }
```

* do not modify state directy
```js
this.state.comment = 'Hello'; // wrong
```

```js
this.setState({comment: 'Hello'});
```
* updates are asynchronous (may batch them together)
* updates are merged
* data flows down

## Events
```js
function ActionLink() {
  function handleClick(e) {
      e.preventDefault();
      console.log('The link was clicked.');
   }
  return (
    <a href="#" onClick={handleClick}>
      Click me
    </a>
  );
}
```
* don't call the handler

## Conditional Rendering
```js
function Greeting(props) {
  const isLoggedIn = props.isLoggedIn;
  if (isLoggedIn) {
    return <UserGreeting />;
  }
  return <GuestGreeting />;
}
```

```js
function Mailbox(props) {
  const unreadMessages = props.unreadMessages;
  return (
    <div>
      <h1>Hello!</h1>
      {unreadMessages.length > 0 &&
         <h2>
            You have {unreadMessages.length} unread messages.
         </h2>
      }
    </div>
  );
}
```

```js
render() {
  const isLoggedIn = this.state.isLoggedIn;
  return (
    <div>
      The user is <b>{isLoggedIn ? 'currently' : 'not'}</b> logged in.    </div>
  );
}
```

### Prevent Component from Rendering
```js
function WarningBanner(props) {
  if (!props.warn) {    return null;  }
  return (
    <div className="warning">
      Warning!
    </div>
  );
}
```

## Lists
```js
function NumberList(props) {
  const numbers = props.numbers;
  const listItems = numbers.map((number) =>
    <li key={number.toString()}>
      {number}
    </li>
  );
  return (
    <ul>{listItems}</ul>
  );
}
```
* keys help React identify which items have changed, are added, or are removed
* should uniquely identify a list item

```js
const todoItems = todos.map((todo, index) =>
  // Only do this if items have no stable IDs  <li key={index}>    {todo.text}
  </li>
);
```

## Forms
### Controlled Components
* input value is controlled by react
```js
class NameForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {value: ''};
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(event) {    this.setState({value: event.target.value});  }
  handleSubmit(event) {
    alert('A name was submitted: ' + this.state.value);
    event.preventDefault();
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <label>
          Name:
          <input type="text" value={this.state.value} onChange={this.handleChange} />
        </label>
        <input type="submit" value="Submit" />
      </form>
    );
  }
}
```

### Multiple Inputs
```js
handleInputChange(event) {
  const target = event.target;
  const value = target.type === 'checkbox' ? target.checked : target.value;
  const name = target.name;
  this.setState({
    [name]: value
  });
}
```

### Composition vs Inheritance
* children
```js
function SplitPane(props) {
  return (
    <div className="SplitPane">
      <div className="SplitPane-left">
        {props.left}      </div>
      <div className="SplitPane-right">
        {props.right}      </div>
    </div>
  );
}

function App() {
  return (
    <SplitPane
      left={
        <Contacts />      }
      right={
        <Chat />      } />
  );
}


```

## Context

## Refs

## Fragements
* any functions can only return one React element
* in order to not overuse divs, React introduced the concept of Fragments
* are not rendered to the DOM
```js
function MyList() {
  return(
    <React.Fragment>
      <Welcome name="Hugo"/>
      <Welcomename="Fritz"/>
      <Welcomename="Franz"/>
    </React.Fragment>
  );
}

function MyList() {
  return(
    <>
      <Welcome name="Hugo"/>
      <Welcomename="Fritz"/>
      <Welcomename="Franz"/>
    </>
  );
}
```

## Higher Order Components

## React <> TypeScript

## React Testing
* describe: test suite (for one component)
* it or test: single test (and single expect)
* snapshot testing allows you to see how your component changed since the last test

```js
import {render, fireEvent, cleanup} from '@testing-library/react';
import App from '../../../App'

afterEach(cleanup)

it('Text in state is changed when button clicked', () => {
    const { getByText } = render(<TestHook />);

    expect(getByText(/Initial/i).textContent).toBe("Initial State")

    fireEvent.click(getByText("State Change Button"))

    expect(getByText(/Initial/i).textContent).toBe("Initial State Changed")
 })


it('button click changes props', () => {
  const { getByText } = render(<App>
                                <TestHook />
                               </App>)

  expect(getByText(/Moe/i).textContent).toBe("Moe")

  fireEvent.click(getByText("Change Name"))

  expect(getByText(/Steve/i).textContent).toBe("Steve")
})
```
* /Initial/i: get first node that has the text "Initial"

## Hooks

## API Calls

## Designing a React Application
1. Design UI
1. Break the UI into a component hierarchy using the single responsibility principle
1. Build a static version
    * only use props (no state)
    * only render() methods
    * the root component takes the data model as a prop
1. Identify the minimal (but complete) representation of UI state
    * is it passed from a parent via props? → probably no state
    * does it remain unchanged over time? → probably no state
    * can you compute it based on any other state or props? → probably no state
    * does not render to UI? → probably no state
1. Identify where your state should live
    * find a common owner component that is a parent of all components that render something from that state
    * create one if you can't find one
1. Add inverse data flow (by passing callbacks)

## Styleguide
* destructure props
* one tag, one line
* props: 3 are okay, 5 smelly, 7 a desaster
* line length: should be less than 80, definitely not more than 120 characters
* only one component per file

### Naming
* components in PascalCase (nouns)
* props, variables and functions in camelCase
* functions that return JSX should start with "render"
* event handlers should start with "handle"
* higher order components should start with "with"
* hooks should start with "use"
* state setter should start with "set"
* functions that compute something should start with "get"
* functions that fetch data should start with "fetch"
