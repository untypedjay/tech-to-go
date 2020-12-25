# Code Quality

# Coding Style

- use camelCase for variables
- use dashes for CSS id values and class names
- use single quotes or when you need it, backticks
- variables should not start with a capital letter (unless they are a class)
- must start with a letter, an underscore or a dollar sign
- you should not start with an underscore or a dollar sign
- dashes are not allowed in variables
- constants that are known at compile time should be named in UPPERCASE

# ESLint & Prettier

Code Quality Issues: [ESLint](https://eslint.org/)

Code Quality Formatting: [Prettier](https://prettier.io/)

## Installation

You need to have already a package.json in your project.

- eslint
- prettier
- eslint-plugin-import (features that include inporting and exporting)
- eslint-plugin-prettier (runs prettier as an eslint rule)
- eslint-config-prettier (to prevent conflictions with prettier
- eslint-config-airbnb (styleguide from Airbnb)
- eslint-plugin-react
- eslint-plugin-react-hooks
- eslint-plugin-node
- eslint-config-node (best practices for node.js)

```bash
npm i -D eslint prettier eslint-plugin-import eslint-plugin-prettier eslint-config-prettier eslint-config-airbnb
npx install-peerdeps -D eslint-config-airbnb
```

## Configuration File

.eslintrc

```json
{
    "env": {
        "browser": true,
        "es6": true
    },
    "extends": [
        "airbnb",
        "prettier"
    ],
    "plugins": [
        "prettier"
    ],
    "globals": {
        "Atomics": "readonly",
        "SharedArrayBuffer": "readonly"
    },
    "parserOptions": {
        "ecmaVersion": 2018,
        "sourceType": "module"
    },
    "rules": {
        "prettier/prettier": [
            "error",
            {
                "singleQuote": true,
                "tabWidth": 2,
                "trailingComma": "es5"
            }
        ],
        "no-unused-vars": "warn"
    }
}
```

## Creating Scripts

package.json

```json
"scripts": {
    "lint": "npx eslint . && echo 'Lint complete.'",
    "lint:fix": "npx eslint . --fix && echo 'Lint complete.'"
}
```

## VS-Code Extension

- install the extension "ESLint"
- edit settings.json:

```json
// These are all my auto-save configs
"editor.formatOnSave": true,
// turn it off for JS and JSX, we will do this via eslint
"[javascript]": {
  "editor.formatOnSave": false
},
"[javascriptreact]": {
  "editor.formatOnSave": false
},
// tell the ESLint plugin to run on save
"editor.codeActionsOnSave": {
  "source.fixAll": true
},
// Optional BUT IMPORTANT: If you have the prettier extension enabled for other languages like CSS and HTML, turn it off for JS since we are doing it through Eslint already
"prettier.disableLanguages": ["javascript", "javascriptreact"],
```

## Disabling ESLint

```jsx
/* eslint-disable */
```

# Debugging

## Console Methods

```jsx
console.group('Doing some stuff'); //console.groupCollapsed();
console.log('Message');
console.info(person.name);
console.error('Error'); // just changes how it looks like in the console
console.warn('Warning');
console.table(people); // list of objects
console.count('running doctorize'); // shows how many times it got called
console.groupEnd('Doing some stuff'); // same string as at the opening
console.dir();

console.time('Timer1');
console.timeEnd('Timer1');
```

## Callstack / Stack Trace

It is shown in the error message in the Developer Tools.

## Grabbing Elements

Select an element in the Developer Tools. Then switch to the console and access the element with `$0`(last element clicked).

Get the value with `$0.value`.

Get the second last element you clicked with `$1` and so on.

```jsx
$('p') // find the first paragraph tag
$$('p') // find all paragraph tags
```

## Breakpoints

```jsx
debugger; // works only when devtools are open
```

The program will stop at that time. After that, the debugger can be used (tab sources).

Alternatively, you can set breakpoints in the Sources Tab of the Devtools.

## Network Requests

Devtools → Network

## Break On Attribute

Devtools → Rightclick on an HTML element → Break on → attribute modifications (sets a breakpoint)

Helpful when you don't know where the code is that does something.
