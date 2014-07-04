# Week 3: JavaScript

Taught by Shawn Allen

### Course Description
This course will provide you with a solid understanding of the JavaScript
programming language and its use in the context of web browsers. We'll learn
language fundamentals and use them in creative applications.

### Software Used
* [Atom](http://atom.io)
* [GitHub](https://github.com)
* [Google Chrome](https://www.google.com/chrome/browser/)

### Resources Referenced
* [Code Academy](http://www.codecademy.com/tracks/javascript) offers a great introduction to the language
* [Eloquent JavaScript](http://eloquentjavascript.net/contents.html) is a more in-depth web book
* [JavaScript: The Definitive Guide](http://www.amazon.com/gp/product/0596805527) is *the* JavaScript book you want on your bookshelf
* Live-coding tools:
  - [JSFiddle](http://jsfiddle.net)
  - [JS Bin](http://jsbin.com/)
  - [CodePen](http://codepen.io)
  - [jsconsole.com](http://jsconsole.com)

## Tuesday, July 1st (6pm - 9pm)
On our first day we covered the basics of JavaScript syntax. The slides are in the [slides directory](https://github.com/GrayAreaorg/Summer-Immersive-2014/blob/master/class_materials/wk3%20-%20JavaScript/slides/day1.html), which you can view locally by cloning this repository. Here's the outline:

* [JavaScript](http://docs.webplatform.org/wiki/javascript) basics:
  - Variables, [the var statement](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/var)) and [data types](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures)
  - [Expressions and operators](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators), [equality](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Equality_comparisons_and_when_to_use_them) and [boolean expressions](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Boolean)
  - Control structures: [if...else](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/if...else), [for](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/for), [for..in](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/for...in), [while](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/while), [switch](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/switch), et al
  - Objects and literals
  - [Global objects and literals](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects)
  - [Functions](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/function)
* Running code in the [Chrome Dev Tools console](https://developer.chrome.com/devtools/docs/console)
* Adding scripts to your HTML
* The [Document Object Model](https://developer.mozilla.org/en-US/docs/Web/API/Document_Object_Model) (DOM)
  - Modifying, adding and removing HTML and CSS
  - [querySelector()](https://developer.mozilla.org/en-US/docs/Web/API/Element.querySelector) and [querySelectorAll()](https://developer.mozilla.org/en-US/docs/Web/API/Element.querySelectorAll)
  - Events and listeners with [addEventListener()](https://developer.mozilla.org/en-US/docs/Web/API/EventTarget.addEventListener)
* Helper libraries:
  - [jQuery](http://jquery.com)
  - [D3](http://d3js.org)
* An example JavaScript-driven [grocery list](http://jsfiddle.net/shawnbot/c9XXU/):
  - using [jQuery](http://jsfiddle.net/shawnbot/9qNAs/)
  - using [D3](http://jsfiddle.net/shawnbot/h6rB3/)
  - with [D3 data binding](http://jsfiddle.net/shawnbot/Q67Ht/)
* [SVG circles with D3](http://jsfiddle.net/shawnbot/x4PtT/)

## Thursday, July 3rd (6pm - 9pm)
**Draft outline:**

* Getting deeper with JavaScript:
  - Object and Array data structures
  - OOP and functional programming
  - `this` and that: scope and calling context
* Drawing pixels with Canvas:
  - The [Canvas API](http://diveintohtml5.info/canvas.html)
* Drawing vectors with SVG:
  - SVG elements and attributes
  - Tools: [D3](http://d3js.org) and [Raphaël](http://raphaeljs.com/)?
  - [Paper.js](http://paperjs.org/)?

## Saturday, July 5th (12pm - 6pm)
**Draft outline:**

* Asynchronous programming:
  - Callback patterns in jQuery and D3 (+Node)
  - Loading external files and the [JSON](http://en.wikipedia.org/wiki/JSON) format
  - Deferring functions with `setTimeout()`
* Repetition and animation:
  - `setInterval()` vs. `requestAnimationFrame()`
* WebGL and Three.js?
