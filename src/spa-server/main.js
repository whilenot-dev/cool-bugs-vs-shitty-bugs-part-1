document.addEventListener("DOMContentLoaded", () => {
  main();
});

function main() {
  addStream();
  window.setTimeout(removeStream, 10000);
}

function addStream() {
  const img = document.createElement("img");

  img.setAttribute("id", "stream");
  img.setAttribute("alt", "loading stream...");
  img.setAttribute("src", "//0.0.0.0:8001/"); // ref to the netcat MJPEG server above
  img.setAttribute("height", "480");
  img.setAttribute("width", "640");

  let count = 0;
  img.addEventListener("load", () => {
    console.log(`images loaded: ${++count}`);
  });

  document.body.appendChild(img);
}

function removeStream() {
  const img = document.getElementById("stream");
  if (!img) {
    return;
  }

  // without the removal of the `src` attribute, the stream will continue
  // loading data in the background
  img.removeAttribute("src");

  img.remove();
}
