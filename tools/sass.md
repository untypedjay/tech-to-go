# Sass

Sass (short for syntactically awesome style sheets) is a **style sheet language** that's compiled to CSS.

Documentation: [https://sass-lang.com/documentation](https://sass-lang.com/documentation)

---

Two syntax options:

1. SCSS Syntax: `.scss` (preferred)
2. Indented Syntax: `.sass`

# Installation

## With the Node Package Manager

Any valid CSS is also valid SCSS.

```bash
sudo npm i -g sass
sass --watch scss/main.scss css/style.css
```

## With a VS-Code Extension

- install extension "Live Sass Compiler"
- go to settings
- search for "Live Sass Compiler"
- Edit in `settings.json`

```json
"liveSassCompile.settings.formats": [
    {
      "format": "compressed",
      "extensionName": ".min.css", // or just .css
      "savePath": "/css"
    }
  ],
"liveSassCompile.settings.generateMap": false,
```

- close settings and click "Watch Sass"

# Variables

Custom Properties in CSS:

Variables in Sass:

```css
:root {
		--primary-color: #272727;
		--accent-color: #FF652F;
		--text-color: #FFFFFF;
}

body {
		background: var(--primary-color);
}
```

```sass
$primary-color: #272727;
$accent-color: #FF652F;
$text-color: #FFFFFF;

body {
		background: $primary-color;
}
```

## Maps

```sass
$font-weights: (
		"regular": 400,
		"medium": 500,
		"bold": 700
);

body {
		font-weight: map-get($font-weights, bold);
}
```

# Nesting

CSS:

```css
nav ul {
	margin: 0;
	padding: 0;
	list-style: none;
}

nav li {
	display: inline-block;
}

nav a {
	display: block;
	padding: 6px 12px;
	text-decoration: none;
}
```

Sass:

```sass
nav {
	ul {
		margin: 0;
		padding: 0;
		list-style: none;
	}

	li {
		display: inline-block;
	}

	a {
		display: block;
		padding: 6px 12px;
		text-decoration: none;
	}
}
```

```sass
.main {
		width: 80%;
		margin: 0 auto;

		&-paragraph {
				font-weight: map-get($font-weights, bold);

				&:hover {
					color: pink;
				}
		}
}
```

The ampersand (`&`) equals the parent.

# Partials

Split up your project into logical partials.

`_resets.scss`

```sass
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}
```

`_config.scss`

`main.scss`

```sass
$primary-color: #272727;
$accent-color: #FF652F;
$text-color: #FFFFFF;
$font-weights: (
		"regular": 400,
		"medium": 500,
		"bold": 700
);
```

```sass
@import 'resets';
@import 'config';

...
```

# Modules

_base.scss

```sass
$font-stack: Helvetica, sans-serif;
$primary-color: #333;

body {
	font: 100% $font-stack;
	color: $primary-color;
}
```

styles.scss

```sass
@use 'base';

.inverse {
	background-color: base.$primary-color;
	color: white;
}
```

# Functions

Functions should be used to compute and return values.

```sass
@function weight($weight-name) {
		@return map-get($font-weights, $weight-name);
}

body {
		font-weight: weight(bold);
}
```

# Mixins

Mixins should define styles. A good use case are vendor prefixes.

```sass
@mixin flexCenter {
		display: flex;
		justify-content: center;
		align-items: center;
}

.main {
		@include flexCenter;
		width: 80%;
		...
}
```

```sass
@mixin flexCenter($direction) {
		display: flex;
		justify-content: center;
		align-items: center;
		flex-direction: $direction;
}

.main {
		@include flexCenter(column);
		width: 80%;
		...
}
```

```sass
@mixin theme($light-theme: true) {
		@if $light-theme {
				background: lighten($primary-color, 100%);
				color: darken($text-color, 100%);
		}
}

.light {
		@include theme($light-theme: true);
}
```

```sass
$mobile: 800px;

@mixin mobile {
		@media (max-width: $mobile) {
				@content;
}

@include mobile {
		flex-direction: column;
}
```

# Extensions

Selectors starting with a `%` will only print if they get extended.

```sass
%equal-heights {
	display: flex;
	flex-wrap: wrap;
}

.main {
		&-paragraph1 {
				font-weight: weight(bold);
		}
		
		&-paragraph2 {
				@extend .main-paragraph1;
				&:hover {
						color: $accent-color;
				}
		}
}
```

# Conditionals

```sass
$light-background: #f2ece4;
$light-text: #036;
$dark-background: #6b717f;
$dark-text: #d2e1dd;

@mixin theme-colors($light-theme: true) {
  @if $light-theme {
    background-color: $light-background;
    color: $light-text;
  } @else {
    background-color: $dark-background;
    color: $dark-text;
  }
}

.banner {
  @include theme-colors($light-theme: true);
  body.dark & {
    @include theme-colors($light-theme: false);
  }
}
```

# Operators

```sass
.container {
	width: 100%;
}

article[role="main"] {
	float: left;
	width: 600px / 690px * 100%;
}

aside[role="complementary"] {
	float: right;
	width: 300px / 960px * 100%;
}
```

# Conditionals

```sass
@mixin triagle($size, $color, $direction) {
	heigth: 0;
	width: 0;

	border-color: transparent;
	border-style: solid;
	border-width: $size / 2;

	@if $direction == up {
		border-bottom-color: $color;
	} @else if $direction == right {
		border-left-color: $color;
	} @else if $direction == down {
		border-top-color: $color;
	} @else if $direction == left {
		border-right-color: $color;
	} @else {
		@error "Unknown direction #{$direction}.";
	}
}

.next {
	@include triangle(5px, black, right);
}
```
