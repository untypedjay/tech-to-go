# Formatting

## Abbreviation `<abbr>`

Defines an abbreviation or an acronym.

```html
<abbr title="World Wide Web">WWW</abbr>
```

## Address `<address>`

Defines contact information for the author/owner of an document/article.

```html
<address>
	Written by <a href="mailto:webmaster@example.com">John Doe</a>,<br>
	Visit us at:<br>
	Example.com<br>
	Box 548, Disneyland<br>
	USA
</address>
```

## Bold Text `<b>`

Defines bold text without any extra importance.

```html
<p>This is normal text - <b>and this is bold text</b>.</p>
```

## Bi-Directional Isolation `<bdi>`

Isolates a part of text that might be formatted in a different direction from other text outside it

```html
<ul>
  <li>User <bdi>hrefs</bdi>: 60 points</li>
  <li>User <bdi>jdoe</bdi>: 80 points</li>
  <li>User <bdi>إيان</bdi>: 90 points</li>
</ul>
```

## Bi-Directional Override `<bdo>`

Overrides the current text direction.

```html
<bdo dir="rtl">This text will go right-to-left.</bdo>
```

## Quotation `<blockquote>`

Defines a section that is quoted from another source.

• gets rendered in its own paragraph and indents slightly from the left margin

```html
<blockquote cite=“http://traversymedia.com”>Veni, Vidi, Vici</blockquote>
```

## Citation `<cite>`

Defines the title of a work.

```html
<p><cite>The Scream</cite> by Edward Munch. Painted in 1893.</p>
```

## Code `<code>`

Defines a piece of computer code.

```html
<code>A piece of computer code</code>
```

## Deleted and Inserted Text `<del>` / `<ins>`

`<del>` defines text that has been deleted from a document.

`<ins>` defines a text that has been inserted into a document.

```html
<p>My favorite color is <del>blue</del> <ins>red</ins>!</p>
```

## Definition `<dfn>`

Marks up the defining instance of a term.

```html
<p><dfn>HTML</dfn> is the standard markup language for creating web pages.</p>
```

## Emphasize `<em>`

Used to emphasize text. Not deprecated, but it is possible to achieve richer effects with CSS.

```html
Okay, listen up people because this is <em>important</em>!
```

## Alternative Text `<i>`

Defines a part of text in an alternate voice or mood.

• any text that you want treated with a different mood or role than regular text

• examples: book titles, technical terms, foreign words, a person‘s thoughts, ...

• gets rendered in italics

Use the `<i>` element only when there is not a more appropriate semantic element, such as:

- `<em>` (emphasized text)
- `<strong>` (important text)
- `<mark>` (marked/highlighted text)
- `<cite>` (the title of a work)
- `<dfn>` (a definition term)

```html
<p>He named his car <i>The lightning</i>, because it was very fast.</p>
```

## Keyboard Input `<kbd>`

Defines keyboard input.

- This tag is not deprecated, but it is possible to achieve richer effect with CSS.

```html
<kbd>Keyboard input</kbd>
```

## Mark Text `<mark>`

- represents text which is marked or highlighted for reference or notation purposes

```html
<p>Serveral species of <mark>salamander</mark> inhabit the temperate rainforest of the Pacific Northwest.</p>
```

## Scalar Measurement `<meter>`

Defines a scalar measurement within a known range, or a fractional value.

- should not be used to indicate progress, use the `<progress>` tag istead
- always add the `<label>` tag for best accessibility practices

```html
<label for="disk_c">Disk usage C:</label>
<meter id="disk_c" value="2" min="0" max="10">2 out of 10</meter>
```

## Preformatted Text `<pre>`

It is displayed in a fixed-width font and it preserves both spaces and line breaks.

```html
<pre>
Text in a pre element
is displayed in a fixed-width
font, and it preserves
both      spaces and
line breaks
</pre>
```

## Progress `<progress>`

Represents the progress of a task.

- always add the `<label>` tag for best accessibility practices

```html
<label for="file">Downloading progress:</label>
<progress id="file" value="32" max="100"> 32% </progress>
```

## Short Quotation `<q>`

Defines a short quotation.

- browsers normally insert quotation marks around the quotation

```html
<p>WWF's goal is to: 
<q>Build a future where people live in harmony with nature.</q>
We hope they succeed.</p>
```

## Ruby Annotations `<rp>`/`<rt>`/`<ruby>`

- `<rp>`: defines what to show in browsers that do not support ruby annotations
- `<rt>:` defines an explanation or pronunciation of characters (for East Asian typography) in a ruby annotation
- `<ruby>:` specifies a ruby annotation

```html
<ruby>
漢 <rt><rp>(</rp>ㄏㄢˋ<rp>)</rp></rt>
</ruby>
```

## Incorrect Text `<s>`

Defines text that is no longer correct

- should not be used to define replaced or deleted text, use the `<del>` tag instead

```html
<p><s>My car is blue.</s></p>
<p>My new car is silver.</p>
```

## Sample Output `<samp>`

Defines sample output from a computer program.

```html
<samp>Sample output from a computer program</samp>
```

## Smaller Text `<small>`

Defines smaller text.

```html
<p>This is some normal text.</p>
<p><small>This is some smaller text.</small></p>
```

## Strong `<strong>`

Defines important text.

• gets rendered in bold font

```html
<strong>Never clickthe red button!</strong> You have been warned.
```

## Subscript `<sub>`

Defines subscripted text.

- inline text that should be displayed as subscript

```html
<p>The chemical element of water is H<sub>2</sub>O</p>
```

## Superscript `<sup>`

Defines superscripted text.

- inline text that should be displayed as superscript

```html

<p><var>a<sup>2</sup></var></p>
```

## Template `<template>`

Defines a template.

- content is hidden from the client
- content can made visible using JavaScript
- use it when you want to use HTML code over and over again but not until you ask for it

```html
<template>
  <h2>Flower</h2>
  <img src="img_white_flower.jpg" width="214" height="204">
</template>
```

## Time `<time>`

Represents a specific period in time.

```html
<p>We open at <time>10:00</time> every morning.</p>

<p>I have a date on <time datetime="2008-02-14 20:00">Valentines day</time>.</p>
```

## Underlined Text `<u>`

Represents some text that should be stylistically different from normal text, such as misspelled words or proper nouns in Chinese.

```html
<p>This is a <u>parragraph</u>.</p>
```

## Variables `<var>`

Defines a variable.

- it's not deprecated, but it is possible to achieve richer effect with CSS

```html
<var>Variable</var>
```

## Word Break Opportunity `<wbr>`

Specifies where in a text it would be ok to add a line-break.

- when a word is too long, or you are afraid that the browser will break your lines at the wrong place, you can use this element

```html
<p>
To learn AJAX, you must be familiar with the XML<wbr>Http<wbr>Request Object.
</p>
```
