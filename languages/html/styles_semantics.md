# Styles & Semantics

## Division Element `<div>`

• holds non semantic content

```html
<div id=“example”>Non-semantic content goes right here</div>
```

## Span `<span>`

• format a small chunk of a larger piece of text such as a phrase, a word, or even a character or three

• is an inline element

```html
<p>
	Notice how an <span style=“font-variant: small-caps”>inline element</span> flows right along with
	the rest of the text.
</p>
```

## Header `<header>`

Represents a container for introductory content or a set of navigational links. It typically contains:

- one or more heading elements
- logo or icon
- authorship information

```html
<body>
	<header>
		<img src=“logo.png“ alt=“Isn‘t it Semantic? company logo“>
		<h1>Welcome to “Isn‘t it Semantic?“</h1>
		<hr>
	</header>
	...
</body>
```

## Page Footer `<footer>`

Defines a footer for a document or section. It typically contains:

- authorship information
- copyright information
- contact information
- sitemap
- back to top links
- related documents
- social media links

```html
<main>
	...
</main>
<footer>
	...
</footer>
```

## Main Content `<main>`

Specifies the main content of a document.

- usually comes right after the header and the navigation
- there is only one <main> in a document

```html
<main>Main content goes here</main>
```

## Section `<section>`

• a major part of the page

• usually a heading followed by some text

• if you want to contain a header into a table of contents, its major enough to be a own section

• it will appear in an article tag

```html
<article>
	<section>
		Section 1 heading goes here
		Section 1 text goes here
	</section>
	<section>
		Section 2 heading goes here
		Section 2 text goes here
	</section>
</article>
```

## Article `<article>`

Specifies independent, self-contained content.

- creates a page section that contains a complete composition of some sort: a blog post, an essay, a poem, a review, a [diatribe](https://de.wikipedia.org/wiki/Diatribe), a news story or a [jeremiad](https://de.wikipedia.org/wiki/Jeremiade)
- in most cases you have a single article in your main section
- it should make sense on its own and it should be possible to distribute it independently from the rest of the site

```html
<main>
	<article>
		Article content goes here
	</article>
<main>
```

## Aside `<aside>`

Defines some content aside from the content it is placed in.

• used to cordon off a bit of the page for content that is at best tangentially related to the main content

• often a sidebar that includes site news or links to recent content, or links to other related site pages

• most often appears within the main area, but after the article content

```html
<main>
	<article>
		...
	</article>
	<aside>
		...
	</aside>
</main>
```

## Details `<details>`

Specifies additional details that the user can view or hide on demand.

```html
<details>
	<summary>Copyright 1999-2019.</summary>
	<p>Text text text</p>
</details>
```

## Machine-Readable Content `<data>`

Links to the given content with a machine-readable translation.

- if the content is time- or date-related, use the `<time>` element

```html
<ul>
  <li><data value="21053">Cherry Tomato</data></li>
  <li><data value="21054">Beef Tomato</data></li>
  <li><data value="21055">Snack Tomato</data></li>
</ul>
```
