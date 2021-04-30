# CSS Selectors

# The Element Selector

```css
h1 {
}
```

# The Class Selector

```css
.caption {
}
```

# The ID selector

```css
#subtitle {
}
```

# The Selector List

```css
header,
.caption,
footer {
}
```

# The Nested Class Selector

> applies to a specific tag that is nested within a specific class

```css
h1.special {
}
```

# The Descendant Selector

> applies to every tag that’s contained within another tag no matter how many levels down the page hierarchy those descendants live

```css
aside a {
}
```

# The Child Selector

> applies to the tags that are a direct child

```css
aside > a {
}
```

# The General Sibling Selector

> applies to all elements that share the same parent with another (e.g. all `span` elements that are a sibling of a `p` element)

```css
p ~ span {
}
```

# The Adjacent Sibling Selector

> applies to all elements that share the same parent and are directly after another (e.g. all `p` elements that are a sibling of a `h2` element and are directly following it)

```css
h2 + p {
}
```

# The Attribute Selector

> applies to elements that have that specific attribute

```css
img[src] {
}

a[href="https://example.com"] {
}

input[name="email"] {
}
```

# The Pseudo Class Selector

> applies to elements that are in a specific state

```css
a:hover {
}
```

# The Pseudo Element Selector

> applies also to a certain part of an element

```css
p::first-line {
}
```
