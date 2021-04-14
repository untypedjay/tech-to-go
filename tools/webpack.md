# Webpack
webpack is an open-source JavaScript 
module bundler. It is a module bundler primarily for JavaScript, but it 
can transform front-end assets like HTML, CSS, and images if the 
corresponding loaders are included.

## Installation
Globally:
`npm i -g webpack`

Locally:
`npm i -D webpack webpackcli`

NPM Scripts:
```json
"start": "webpack"
```

## Concept
Webpack looks up all dependencies and bundles them together with your code into `app.bundle.js`.

## Loaders
`npm i css-loader style-loader -D`

### `webpack.config.js`
```js
module.exports = {
  mode: 'development',
  devtool: 'none',
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
* development mode does not minify the code
