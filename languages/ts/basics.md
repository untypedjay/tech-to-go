# TypeScript Basics
Every JavaScript code is valid TypeScript code.

## Installation
```zsh
sudo npm install -g typescript
tsc --version
tsc main.ts # transpile a ts file
node main.js
```

## Types
```ts
let a: number;
let b: boolean;
let c: string;
let d: any;
let e: number[] = [1, 2, 3];

enum Color { Red, Green, Blue }; // first element gets the value of 0
let backgroundColor = Color.Red;
```

## Type Assertions
```ts
let message = 'abc';
let endsWithC = (<string>message).endsWith('c');
let alternativeWay = (message as string).endsWith('c');
```

## Custom Types
```ts
interface Point {
  x: number,
  y: number
}

let drawPoint = (point: Point) => {
  //..
};
```
