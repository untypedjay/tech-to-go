# React
React is an open-source JavaScript library for building user interfaces maintained by Facebook.

## Setup
* direct import (`<script>` + CDN)
* single page apps: [Create React App](https://github.com/facebook/create-react-app)
```bash
npx create-react-app my-app --template typescript
```
* websites (static content): [Gatsby](https://www.gatsbyjs.com/)
* server side rendering: [Next.js](https://nextjs.org/)
* Custom Setup (package manager + module bundler + transpiler)

### Hello World
```js
ReactDOM.render(
  <h1>Hello, world!</h1>,
  document.getElementById('root')
);
```
## JSX
JSX is a syntax extension to JavaScript to describe what the UI should look like.
It produces React elements that will be rendered to the DOM. It is not required in order to use React, but is usually easier to visualize the UI in that way.
* can be nested
* children without content should use the self closing tag
* input is safe from injection attacks

### Embedded Expressions
* any valid JavaScript expression can be put between curly braces in JSX
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
* `class` -> `className`
* `tabindex` -> `tabIndex`
* `for` -> `htmlFor`
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
* objects produced by `createElement` are called React elements
* an element describes what you want to see on the screen
* are unlike the DOM cheap to create
* immutable, like a single frame in a movie: UI representation at a certain point in time
* only way to update the UI is to create a new element and pass it to `ReactDOM.render()`
* ReactDOM compares the element to the previous one and only applies that stuff that changed

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

## Components
* components always start with a capital letter
* lower case letters are reserved for DOM tags

### Class Components
* extend `React.Component`
* has a `render()` method that returns a React element
```js
class Welcome extends React.Component {
  render() {
    return <h1>Hello, {this.props.name}</h1>;
  }
}
```

### Function Components
* accept a single `props` argument
* return a React element

```js
function Welcome(props) {
  return <h1>Hello, {props.name}</h1>;
}
```

```js
const element = <Welcome name="Sara" />;ReactDOM.render(
  element,
  document.getElementById('root')
);
```

Recap:
1. call `ReactDOM.render()` with the component as an element
2. React calls the component with the props
3. component returns a React element
4. React DOM efficiently updates the DOM

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

### Classes vs Function components
* they work side by side
* class components used to have more features
* since the introduction of hooks in React 16.8, functional components have the same functionality (and even more)

Function components are recommended for new components, because:
* they provide a more direct API
* reusability of state logic through custom hooks
* do not split up use cases into multiple lifecycle methods
* do not deal with `this` binding
* more readable
* easier for computers (classes cause issues in certain build tools)

### Best practices:
* single component per file
* rendering should fit on one screen (about 50 LOC)
* split when it gets too long, too complex, contradicts single responsibility principle, needs to be reused
* one tag, one line

## Props
* read only (pure functions)
* can (and should) be destructured
* props: 3 are okay, 5 smelly, 7 a desaster

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

When to decide if data should be state:
* is it passed from a parent via props? → probably no state
* does it remain unchanged over time? → probably no state
* can you compute it based on any other state or props? → probably no state
* does not render to UI? → probably no state

Using State Correctly:
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

### `componentWillUnmount()`
* runs before a component unmounts
```js
 componentWillUnmount() {
    clearInterval(this.timerID);
 }
```

### `componentDidUpdate()`

## Events
* [SyntheticEvent](https://reactjs.org/docs/events.html)
* `onClick`, `onHover`, `onMouseOver` and many more
```js
function ActionLink() {
  const handleClick = (e) => {
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
* control flow statements
```js
function Greeting(props) {
  const isLoggedIn = props.isLoggedIn;
  if (isLoggedIn) {
    return <UserGreeting />;
  }
  return <GuestGreeting />;
}
```

* Conditional Abuse
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

* ternary operator
```js
render() {
  const isLoggedIn = this.state.isLoggedIn;
  return (
    <div>
      The user is <b>{isLoggedIn ? 'currently' : 'not'}</b> logged in.
    </div>
  );
}
```

### Prevent Component from Rendering
```js
function WarningBanner(props) {
  if (!props.warn) {
    return null;
  }
  
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
  // Only do this if items have no stable IDs
  <li key={index}>
    {todo.text}
  </li>
);
```

## Forms
### Controlled Components
* input value is controlled by react
* use almost every time
```js
class NameForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {value: ''};
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(event) {
    this.setState({value: event.target.value});
  }
  
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

### Uncontrolled Components
* input values are handled by the DOM
* use when it is tedious to write all event handlers or when migrating from a non React codebase
```js
class NameForm extends React.Component {
  constructor(props) {
    super(props);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.input = React.createRef();  }

  handleSubmit(event) {
    alert('A name was submitted: ' + this.input.current.value);
    event.preventDefault();
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <label>
          Name:
          <input type="text" ref={this.input} />
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
* `children` props
```js
function SplitPane(props) {
  return (
    <div className="SplitPane">
      <div className="SplitPane-left">
        {props.left}
      </div>
      <div className="SplitPane-right">
        {props.right}
      </div>
    </div>
  );
}

function App() {
  return (
    <SplitPane
      left={<Contacts />}
      right={<Chat />}
    />
  );
}
```

## Fragments
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

## Hooks
### `useState`
```js
function Example() {
  const [count, setCount] = useState(0);
  
  return (
    <div>
      <p>You clicked {count} times</p>
      <button onClick={() => setCount(count + 1)}>
        Click me
      </button>
    </div>
  );
}
```

Updating object properties:
```js
setPerson({ ...person, message: 'hello world' });
```

### `useEffect`
```js
import React, { useState, useEffect } from 'react';

function Example() {
  const [count, setCount] = useState(0);

  useEffect(() => {
    document.title = `You clicked ${count} times`;
  });

  return (
    <div>
      <p>You clicked {count} times</p>
      <button onClick={() => setCount(count + 1)}>
        Click me
      </button>
    </div>
  );
}
```

```js
function FriendStatus(props) {
  const [isOnline, setIsOnline] = useState(null);

  useEffect(() => {
    function handleStatusChange(status) {
      setIsOnline(status.isOnline);
    }
    ChatAPI.subscribeToFriendStatus(props.friend.id, handleStatusChange);
    return function cleanup() {
      ChatAPI.unsubscribeFromFriendStatus(props.friend.id, handleStatusChange);
    };
  });

  if (isOnline === null) {
    return 'Loading...';
  }
  return isOnline ? 'Online' : 'Offline';
}
```

```js
useEffect(() => {
  document.title = `You clicked ${count} times`;
}, [count]);
```

### `useCallback`
* memoized callback
* only changes when dependencies change
```js
const memoizedCallback = useCallback(
  () => {
    doSomething(a, b);
  },
  [a, b],
);
```
### Other Hooks
* `useContext`: for the Context API
* `useReducer`: more sophisticated version of `useState`
* `useMemo`: for memoized values (similar to `useCallback`)
* `useRef`: creating references

### Custom Hooks
* `useLocalStorage`
```js
import { useState } from 'react';

function useLocalStorage(key, initialValue) {
	const [storedValue, setStoredValue] = useState(() => {
		try {
			const item = window.localStorage.getItem(key);
			return item ? JSON.parse(item) : initialValue;
		} catch (error) {
			console.error(error);
			return initialValue;
		}
	});

	const setValue = value => {
		try {
			const valueToStore = value instanceof Function ? value(storedValue) : value;
			setStoredValue(valueToStore);
			window.localStorage.setItem(key, JSON.stringify(valueToStore));
		} catch (error) {
			console.error(error);
		}
	};

	return [storedValue, setValue];
}

export default useLocalStorage;
```

## Context
Context provides a way to pass data through the component tree without having to pass props down manually at every level.

When to use Context:
* for data that is considered "global" for a tree of React components
* when some data needs to be accessible by many components at different nesting levels

```js
import React, { useContext, useState } from 'react';
import PropTypes from 'prop-types';

const AccountContext = React.createContext();
const AccountUpdateContext = React.createContext();

export function useAccount() {
  return useContext(AccountContext);
}

export function useAccountUpdate() {
  return useContext(AccountUpdateContext);
}

export function AccountProvider({ children }) {
  const [account, setAccount] = useState(null);
  
  const updateAccount = newAccount => {
    setAccount(newAccount);
  };
  
  return (
    <AccountContext.Provider value={account}>
      <AccountUpdateContext.Provider value={updateAccount}>
        { children }
      </AccountUpdateContext.Provider>
    </AccountContext.Provider>
  );
}

AccountProvider.propTypes = {
  children: PropTypes.object
}
```
* consumed with `<AccountContext.Consumer>`

## React <> TypeScript
* types vs interface?
	* does not really matter (but should be consistent)
	* [Details](https://github.com/typescript-cheatsheets/react#types-or-interfaces)	 
* enums (alternatives)
* return type: `JSX.Element`

```ts
const [user, setUser] = React.useState<IUser | null>(null);
```

* prop type examples
```ts
export declare interface AppProps {
  children1: JSX.Element; // bad, doesnt account for arrays
  children2: JSX.Element | JSX.Element[]; // meh, doesn't accept strings
  children3: React.ReactChildren; // despite the name, not at all an appropriate type; it is a utility
  children4: React.ReactChild[]; // better, accepts array children
  children: React.ReactNode; // best, accepts everything (see edge case below)
  functionChildren: (name: string) => React.ReactNode; // recommended function as a child render prop type
  style?: React.CSSProperties; // to pass through style props
  onChange?: React.FormEventHandler<HTMLInputElement>; // form events! the generic parameter is the type of event.target
  //  more info: https://react-typescript-cheatsheet.netlify.app/docs/advanced/patterns_by_usecase/#wrappingmirroring
  props: Props & React.ComponentPropsWithoutRef<"button">; // to impersonate all the props of a button element and explicitly not forwarding its ref
  props2: Props & React.ComponentPropsWithRef<MyButtonWithForwardRef>; // to impersonate all the props of MyButtonForwardedRef and explicitly forwarding its ref
}
```

## React Testing
* `describe`: test suite (for one component)
* `it` or `test`: single test (and single expect)
* snapshot testing allows you to see how your component changed since the last test

```js
it('matches snapshot', () => {
    const { asFragment } = render(<Trends trends={mockTrends}/>);
    expect(asFragment()).toMatchSnapshot();
});
```

* one `expect` per test
* write descriptive test names
* do not test implementation details

* mocking components???
* Enzyme

```js
import {render, fireEvent, cleanup} from '@testing-library/react';
import App from '../../../App'

afterEach(cleanup)

it('Text in state is changed when button clicked', () => {
    const { getByText } = render(<TestHook />);
    fireEvent.click(getByText("State Change Button"))
    expect(getByText(/Initial/i).textContent).toBe("Initial State Changed")
 })


it('button click changes props', () => {
  const { getByText } = render(<App>
                                <TestHook />
                               </App>)

  fireEvent.click(getByText("Change Name"))
  expect(getByText(/Steve/i).textContent).toBe("Steve")
})
```
* /Initial/i: get first node that has the text "Initial"

### Testing CSS
```js
import React from 'react'import 'jest-dom/extend-expect'
import { render, cleanup } from 'react-testing-library'import MyHeader from './MyHeader'afterEach(cleanup)test('It has to contain My Header', () => {
  render(
    <div>
      <MyHeader />
    </div>
  )  const headerClass = MyHeader().type.styledComponentId
  const MyHeaderRoots = document.getElementsByClassName(headerClass)
  const style = window.getComputedStyle(MyHeaderRoots[0])  expect(style.position).toBe('fixed')
  expect(style.top).toBe('0px')
})
```

## API Calls
* axios:
```js
useEffect(() => {
        const fetchUsers = async () => {
            try {
                setData({users: data.users, isFetching: true});
                const response = await axios.get(USER_SERVICE_URL);
                setData({users: response.data, isFetching: false});
            } catch (e) {
                console.log(e);
                setData({users: data.users, isFetching: false});
            }
        };
        fetchUsers();
    }, []);
```

* fetch:
```js
const [users, setUsers] = useState([]);
const [isLoading, setIsLoading] = useState(true);

const fetchUsers = async () => {
	const response = await fetch(url);
	// handle erros with response.status
	const users = await response.json();
	setUsers(users);
	setIsLoading(false);
};

useEffect(() => {
	fetchUsers();
}, []);
```

## React Router
```js
const App = () => {
	return (
		<Router exact path="/">
			<Home/>
		</Router>
		<Router path="/about">
			<About/>
		</Router>
		<Router path="/books/:id">
			<Book/>
		</Router>
		<Router path="*">
			<Error/>
		</Router>
	);
};
```
Getting a template parameter:
```js
const { id } = useParams();
```

Links:
```js
<Link to="/about">About</Link>
```

## Designing a React Application
1. Design UI
1. Break the UI into a component hierarchy using the single responsibility principle
1. Build a static version
    * only use props (no state)
    * only render() methods
    * the root component takes the data model as a prop
1. Identify the minimal (but complete) representation of UI state
1. Identify where your state should live
    * find a common owner component that is a parent of all components that render something from that state
    * create one if you can't find one
1. Add inverse data flow (by passing callbacks)


## File Structure

## Naming
* components in PascalCase (nouns)
* props, variables and functions in camelCase
* functions that return JSX should start with "render"
* event handlers should start with "handle"
* higher order components should start with "with"
* hooks should start with "use"
* state setter should start with "set"
* functions that compute something should start with "get"
* functions that fetch data should start with "fetch"
