# Webpack
webpack is an open-source JavaScript 
module bundler. It is a module bundler primarily for JavaScript, but it 
can transform front-end assets like HTML, CSS, and images if the 
corresponding loaders are included.

## Installation
`npm i -g webpack`

## Concept
Webpack looks up all dependencies and bundles them together with your code into `app.bundle.js`.

## Loaders
`npm i css-loader style-loader -D`

### `webpack.config.js`
```js
module.exports = {
  entry: './app.js',
  output: {
    path: __dirname,
    filename: 'bundle.js'
  },
  module: {
    loaders: [
      { test: /\.css$/, loader: 'style-loader!css-loader }
    ]
  }
}
```
