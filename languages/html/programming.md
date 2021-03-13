# Programming

## JavaScript Code `<script>`

Used to define a client-side script.

```html
<script>
document.getElementById("demo").innerHTML = "Hello JavaScript!";
</script>
```

## Noscript `<noscript>`

Defines an alternate content for users that have disabled scripts in their browser.

```html
<script>
document.write("Hello World!")
</script>
<noscript>Your browser does not support JavaScript!</noscript>
```

## External Application `<embed>`

Defines a container for an external application or interactive content (a plug-in).

```html
<embed src="helloworld.swf">
```

## Embedded Objects `<object>`

Defines an embedded object within an HTML document. Use this element to embed multimedia (like audio, video, Java applets, ActiveX, PDF, and Flash) in your web pages.

- you can also emed other webpages

```html
<object width="400" height="400" data="helloworld.swf">
	<param name="autoplay" value="true">
</object>
```
