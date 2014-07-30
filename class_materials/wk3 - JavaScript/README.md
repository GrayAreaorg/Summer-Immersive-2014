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
Tonight we went deeper into JavaScript:

* [Object-oriented](http://en.wikipedia.org/wiki/Object-oriented_programming) vs. [Functional](http://en.wikipedia.org/wiki/Functional_programming) programming
- [Object](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object) and [Array](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array) data structures
- Prototypal inheritance with [Object.prototype](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/prototype)
- `this` and [function calling](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Functions) context via [call()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/call) and [apply()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/apply)

Then we dove into two very different graphics APIs:

1. Drawing pixels with [Canvas](http://diveintohtml5.info/canvas.html):
  - The [Canvas 2D Context API](https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D)
  - Check out this [Canvas cheat sheet](http://cheatsheetworld.com/programming/html5-canvas-cheat-sheet/) or [this one](http://blog.nihilogic.dk/2009/02/html5-canvas-cheat-sheet.html) in [PDF](http://www.nihilogic.dk/labs/canvas_sheet/HTML5_Canvas_Cheat_Sheet.pdf) or [PNG](http://www.nihilogic.dk/labs/canvas_sheet/HTML5_Canvas_Cheat_Sheet.png)
  - [This guide](http://bucephalus.org/text/CanvasHandbook/CanvasHandbook.html) is comprehensive, but dense
2. Drawing vectors with SVG:
  - SVG elements and attributes
  - Tools:
    - [D3](http://d3js.org)
    - [Raphaël](http://raphaeljs.com/)
    - ~~[Paper.js](http://paperjs.org/)~~
* Playtime:
  - a rudimentary Canvas [drawing app](http://jsfiddle.net/shawnbot/BNHx5/1/)
  - a [version that snaps to a grid](http://jsfiddle.net/shawnbot/BNHx5/2/)
  - a simliar [drawing app in D3](http://jsfiddle.net/shawnbot/KF7P7/)
  - a more [psychedelic version](http://jsfiddle.net/shawnbot/KF7P7/8/)

Here are [the slides](https://github.com/GrayAreaorg/Summer-Immersive-2014/blob/master/class_materials/wk3%20-%20JavaScript/slides/day2.html), but you'll probably have more luck running them locally.
  

## Saturday, July 5th (12pm - 6pm)
On Saturday we covered the basics of loading external files, the JSON standard, and hacked on some [animated sketches](examples/) and SVG.

* Asynchronous programming:
  - Loading external files:
    * with [XMLHttpRequest](https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest)
    * with [jQuery.ajax()](http://api.jquery.com/jquery.ajax/)
    * with [d3.xhr() and related functions](https://github.com/mbostock/d3/wiki/Requests)
* The [JSON format](http://en.wikipedia.org/wiki/JSON)
  - Parsing with [JSON.parse()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/parse)
  - Serializing with [JSON.stringify()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/stringify)
* [Cross-Origin Resource Sharing](https://developer.mozilla.org/en-US/docs/Web/HTTP/Access_control_CORS)
  - Testing locally with `python -m SimpleHTTPServer` (see: [the Python module](http://effbot.org/librarybook/simplehttpserver.htm))
* Repetition with [setInterval()](https://developer.mozilla.org/en/docs/Web/API/window.setInterval)
  - See also: [requestAnimationFrame()](https://developer.mozilla.org/en-US/docs/Web/API/window.requestAnimationFrame)
* ~~WebGL and Three.js?~~
* See the [examples directory](examples/) for the sketches.
  
