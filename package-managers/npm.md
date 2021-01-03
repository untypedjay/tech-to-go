# npm

**npm** (originally short for Node Package Manager) is a package manager for the JavaScript programming language.

Find modules on [npmjs.com](https://www.npmjs.com/)

# package.json

- Manifest file with app info
- lists dependencies
- specify if versions should be updated
- create NPM scripts

The file `package-lock.json` ensures that installations remain identical and reproducible throughout their entire dependency tree, across users, such as teams members working together, and across systems.

# Commands

```bash
# see the version of npm
npm -v
# create package.json
npm init
# create package.json with defaults
npm init -y
# get help
npm help
# change default author name
npm config set init-author-name "John Doe"
# change default licence
npm set init-licence "MIT"
# see what the default author is
npm get init-author-name
# reset the default author
npm config delete init-author-name
# reset the default licence
npm config delete init-licence
# install a module to the Dependencies
npm i lodash
# install multiple modules to the devDependencies
npm i --save-dev gulp gulp-sass
# run an app
node appname
# install all dependencies & devDependencies
npm i
# install only production dependencies
npm i --production
# uninstall a dependency
npm uninstall gulp-sasss --save-dev
npm remove gulp --save-dev
npm rm lodash
# install a specific version
npm install lodash@4.17.3
# update to the latest version
npm update lodash
# install a global module
npm install -g nodemon
# see where your global modules are saved
npm root -g
# remove a global module
npm remove -g nodemon
# show dependencies
npm list
npm list -depth 1
```

# Versions

```json
"lodash": "^4.17.4" // update to the latest minor version
"lodash": "^4.17.4" // update to the latest patch version
"lodash": "4.17.4" // install exact this version
"lodash": "*" // update to the latest major version
```

# Scripts

```json
"scripts": {
	"start": "node start.js"
}
```

The command `npm start` will then execute `node start.js`.
