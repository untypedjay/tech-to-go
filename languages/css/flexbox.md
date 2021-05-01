# Flexbox
## Container Properties

### display
Defines a flex container.

```css
.container {
	display: flex; /* or inline-flex */
}
```

### flex-direction
Defines the main axis. Default is `row`.

```css
.container {
	flex-direction: row | row-reverse | column | column-reverse;
}
```

### flex-wrap
Allows items to go on multiple lines. By default, all flex items fit onto one line (`nowrap`).

```css
.container {
	flex-wrap: nowrap | wrap | wrap-reverse;
}
```

### flex-flow
Shorthand for `flex-direction` and `flex-wrap`.

```css
.container {
	flex-flow: <flex-direction> <flex-wrap>;
}
```

### justify-content
Defines the alignment along the main axis. Default is `flex-start`.

```css
.container {
	justify-content: flex-start | flex-end | center | space-between | space-around | space-evenly;
}
```

### align-item
Defines the alignment along the cross axis. Default is `stretch`.

```css
.container {
	align-items: stretch | flex-start | flex-end | center | baseline;
}
```

### align-content
Defines how to handle extra space on the cross axis when having multiple lines (`flex-wrap`). Default is `stretch`.

```css
.container {
	align-content: flex-start | flex-end | center | space-between | space-around | space-evenly | stretch;
}
```

## Item Properties
### order
Defines the order of the items. Default is `0`.

```css
.item {
	order: <integer>;
}
```

### flex-grow
Defines how to take up extra space. Default: `0`.

```css
.item {
	flex-grow: <number>;
}
```

### flex-shrink
Defines how to shrink if there is not enough space. Default is `1`.

```css
.item {
	flex-shrink: <number>;
}
```

### flex-basis
Defines the default size.  Default is `auto`, which means "look at my `width` or `height`".

```css
.item {
	flex-basis: <length> | auto;
}
```

### flex
Shorthand for `flex-grow`, `flex-shrink`(optional) and `flex-basis`(optional).

```css
.item {
	flex: <flex-grow> <flex-shrink> <flex-basis>;
}
```

### align-sel
Override the default alignment from `align-items`. Default is `auto`.

```css
.container {
	align-self: auto | flex-start | flex-end | center | baseline | stretch;
}
```

## Additional Resources

- [https://css-tricks.com/snippets/css/a-guide-to-flexbox/](https://css-tricks.com/snippets/css/a-guide-to-flexbox/)
