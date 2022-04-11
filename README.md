# Steaming video via Motion JPEG and counting established TCP sockets

This is the playground for a [blog post](https://blog.whilenot.dev/posts/cool-bugs-vs-shitty-bugs-part-1/). It consists of a simple MJPEG stream video server and an SPA.

The `main` branch has the fix already applied. To recreate the mentioned bug just comment out `img.removeAttribute("src")` in `main.js`.

Have fun!

## Usage

To launch the MJPEG server:

```bash
$ ./src/mjpeg-server/serve
```

To launch the SPA:

```bash
$ ./src/spa-server/serve
```
