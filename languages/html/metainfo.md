# Metainfo

Meta tags always go inside the `<head>` tag.

```html
<!-- define the encoding -->
<meta charset="UTF-8"/>

<!-- define keywords for search engines -->
<meta name="keywords" content="HTML, CSS, XML, XHTML, JavaScript"/>

<!-- define a description -->
<meta name="description" content="Free Web tutorials on HTML and CSS"/>

<!-- define the author -->
<meta name="author" content="name, email@hotmail.com"/>

<!-- refresh the document every 30 seconds -->
<meta http-equiv="refresh" content="30"/>

<!-- set the viewport to make your website look good on all devices -->
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>

<meta name="subject" content="your website's subject"/>
<meta name="copyright"content="company name"/>
<meta name="language" content="ES"/>
<meta name="robots" content="index,follow" />
<meta name="revised" content="Sunday, July 18th, 2010, 5:15 pm" />
<meta name="abstract" content=""/>
<meta name="topic" content=""/>
<meta name="summary" content=""/>
<meta name="Classification" content="Business"/>
<meta name="designer" content=""/>
<meta name="copyright" content=""/>
<meta name="reply-to" content="email@hotmail.com"/>
<meta name="owner" content=""/>
<meta name="url" content="http://www.websiteaddrress.com"/>
<meta name="identifier-URL" content="http://www.websiteaddress.com"/>
<meta name="directory" content="submission"/>
<meta name="category" content=""/>
<meta name="coverage" content="Worldwide"/>
<meta name="distribution" content="Global"/>
<meta name="rating" content="General"/>
<meta name="revisit-after" content="7 days"/>
<meta http-equiv="Expires" content="0"/>
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
```

## Base `<base>`

Specifies the base URL/target for all relative URLs in a document.

- there can be only one `<base>` element and it has to be inside the `<head>` element

```html
<!DOCTYPE html>
<html>
<head>
  <base href="https://www.w3schools.com/" target="_blank">
</head>
<body>

<h1>The base element</h1>

<p><img src="images/stickman.gif" width="24" height="39" alt="Stickman"> - Notice that we have only specified a relative address for the image. Since we have specified a base URL in the head section, the browser will look for the image at "https://www.w3schools.com/images/stickman.gif".</p>

<p><a href="tags/tag_base.asp">HTML base tag</a> - Notice that the link opens in a new window, even if it has no target="_blank" attribute. This is because the target attribute of the base element is set to "_blank".</p>

</body>
</html>
```
