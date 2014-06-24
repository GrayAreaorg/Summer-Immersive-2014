/*
[].forEach.call(document.getElementsByClassName("f"), function(node) {
  node.classList.add("fragment");
});
*/

[].forEach.call(document.querySelectorAll("code, *[data-trim]"), function(node) {
  node.innerText = String(node.innerText).trim();
});

Reveal.initialize({
  transition: "fade",
  history: true
});

hljs.initHighlightingOnLoad();
