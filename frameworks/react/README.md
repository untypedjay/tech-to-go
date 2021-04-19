# React
React is a JavaScript library for building user interfaces.

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
