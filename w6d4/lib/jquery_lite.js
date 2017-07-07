/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

const DOMNodeCollection = __webpack_require__(1);
window.$l = function (selector) {

  if (typeof selector === 'string') {
    let list = document.querySelectorAll(selector);
    list = Array.from(list);
    return new DOMNodeCollection(list);
  } else if (selector instanceof HTMLElement) {
    return new DOMNodeCollection([selector]);
  }
};


/***/ }),
/* 1 */
/***/ (function(module, exports) {

class DOMNodeCollection {
  constructor(HTMLElements) {
    this.elements = HTMLElements;
  }

  html(str) {
    if (typeof str === 'string') {
      this.elements.forEach((el) => {
        el.innerHTML = str;
      });
    } else {
      if (this.elements.length > 0) {
        return this.elements[0].innerHTML;
      }
    }
  }

  empty() {
    this.html("");
  }

  append(arg) {
    this.elements.forEach((node) => {
      if (arg instanceof DOMNodeCollection) {
        arg.elements.forEach((el) => {
          node.innerHTML = node.innerHTML.concat(el.outerHTML);
        });
      } else if (arg instanceof HTMLElement) {
        node.innerHTML = node.innerHTML.concat(arg.outerHTML);
      } else if (typeof arg === 'string') {
        console.log(arg);
        console.log(node);
        console.log(node.innerHTML);
        node.innerHTML = node.innerHTML.concat(arg);
      }
    });
  }

  attr(attrName, attrValue) {
    if (attrValue) { // setter
      this.elements.forEach((el) => {
        if (attrValue) {
          el.setAttribute(attrName, attrValue);
        } else {
          el.getAttribute(attrName);
        }
      });
    } else { // getter
      return this.elements[0].getAttribute(attrName);
    }
  }
}


module.exports = DOMNodeCollection;


/***/ })
/******/ ]);