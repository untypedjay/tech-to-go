# Audio & Video

## Audio `<audio>`

Defines sound, such as music or other audio streams.

- currently, there are 3 supported file formats: MP3 (full browser support), WAV (not supported by IE) and OGG (not supported by IE and Safari)

```html
<audio controls>
  <source src="horse.ogg" type="audio/ogg">
  <source src="horse.mp3" type="audio/mpeg">
	<source src="horse.wav" type="audio/wav">
  Your browser does not support the audio element.
</audio>
```

## Subtitles `<track>`

Specifies text tracks for media elements (audio and video).

```html
<video width="320" height="240" controls>
  <source src="forrest_gump.mp4" type="video/mp4">
  <source src="forrest_gump.ogg" type="video/ogg">
  <track src="subtitles_en.vtt" kind="subtitles" srclang="en" label="English">
  <track src="subtitles_no.vtt" kind="subtitles" srclang="no" label="Norwegian">
</video>
```

## Video `<video>`

Defines a video or movie.

- currently, there are 3 supported video formats: MP4 (full support), WebM and OGG (both not supported by IE and Safari)

```html
<video width="320" height="240" controls>
  <source src="movie.mp4" type="video/mp4">
  <source src="movie.ogg" type="video/ogg">
  Your browser does not support the video tag.
</video>
```
