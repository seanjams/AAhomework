const DOMNodeCollection = require("./dom_node_collection");
window.$l = function (selector) {

  if (typeof selector === 'string') {
    let list = document.querySelectorAll(selector);
    list = Array.from(list);
    return new DOMNodeCollection(list);
  } else if (selector instanceof HTMLElement) {
    return new DOMNodeCollection([selector]);
  }
};
