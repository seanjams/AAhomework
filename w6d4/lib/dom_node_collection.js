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
