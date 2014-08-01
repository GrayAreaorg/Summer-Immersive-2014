/*
[].forEach.call(document.getElementsByClassName("f"), function(node) {
  node.classList.add("fragment");
});
*/

[].forEach.call(document.querySelectorAll("code, *[data-trim]"), function(node) {
  node.innerHTML = String(node.innerHTML).trim();
});

Reveal.initialize({
  transition: "fade",
  history: true
});

hljs.initHighlightingOnLoad();
