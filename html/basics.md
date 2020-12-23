# Basics

# Inline vs Block Level Elements

- Inline Elements do not start on a new line and only take the necessary width (e.g. `span` `img` `a`)
- Block Elements start on a new line and take the full width available (e.g. `div` `h1` `p` `form`)

# Basic HTML

## Headings

There are six headings from `<h1>` to `<h6>` but you should only use the first four.

• use `<h1>` for the overall page title or application name

• use `<h2>` for the page subtitle

• use `<h3>` for the titles of the main sections of your page

• use `<h4>` for the titles of the subsection of your page

Only have one `<h1>` on your page which should describe the topic of your page and it should be about 20 - 70 characters long. Also use a keyword in your `<h1>`.

### Header Group `<hgroup>`

Represents a multi-level heading for a section of a document.

```html
<hgroup>
  <h1>Calculus I</h1>
  <h2>Fundamentals</h2>
</hgroup>
```

## Paragraphs `<p>`

- a basic text paragraph
- `<p>` is a block-level element

## Line Break `<br>`

• the next text gets displayed on a new line

## Horizontal rule `<hr>`

• adds a horizontal line across the web page

```html
<!-- full line —->
Okay, listen up people because this is <em>important</em>!
<hr>

<!—- line that takes only 50% of the page width —->
Okay, listen up people because this is<em>important</em>!
<hr width=“50%“>
```
