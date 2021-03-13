# Images

## Images `<img>`

Defines an image.

```html
<img src=“logo.png“ width=“100” align=“right” alt=“The Logophilia Ltd. company logo“>
```

## Map `<map>`

Define a client-side image-map. An image-map is an image with clickable areas.

```html
<img src="planets.gif" width="145" height="126" alt="Planets" usemap="#planetmap">

<map name="planetmap">
  <area shape="rect" coords="0,0,82,126" alt="Sun" href="sun.htm">
  <area shape="circle" coords="90,58,3" alt="Mercury" href="mercur.htm">
  <area shape="circle" coords="124,58,8" alt="Venus" href="venus.htm">
</map>
```

## Canvas `<canvas>`

Draw graphics on the fly via scripting (usually JavaScript).

```html
<canvas id="myCanvas">Your browser does not support the HTML5 canvas tag.</canvas>

<script>
var c = document.getElementById("myCanvas");
var ctx = c.getContext("2d");
ctx.fillStyle = "#FF0000";
ctx.fillRect(0, 0, 80, 100);
</script>
```

## Figure `<figure>`

Specifies self-contained content, like illustrations, diagrams, photos, code listings, etc.

- to caption and wrap your image

```html
<figure>
  <img src="pic_trulli.jpg" alt="Trulli" style="width:100%">
  <figcaption>Fig.1 - Trulli, Puglia, Italy.</figcaption>
</figure>
```

## Picture `<picture>`

Multiple images can be designed to more nicely fill the browser viewport.

- the browser will use the first `<source>` element with a matching hint and ignores everything else

```html
<picture>
  <source media="(min-width: 650px)" srcset="img_pink_flowers.jpg">
  <source media="(min-width: 465px)" srcset="img_white_flower.jpg">
  <img src="img_orange_flowers.jpg" alt="Flowers" style="width:auto;">
</picture>
```

## SVG `<svg>`

Defines a container for SVG graphics.

```html
<svg width="100" height="100">
  <circle cx="50" cy="50" r="40" stroke="green" stroke-width="4" fill="yellow" />
  Sorry, your browser does not support inline SVG.
</svg>
```
