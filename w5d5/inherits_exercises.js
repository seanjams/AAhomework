// Function.prototype.inherits = function (parent) {
//
//   let Surrogate = function () {};
//
//   Surrogate.prototype = parent.prototype;
//   this.prototype = new Surrogate();
//   this.prototype.constructor = this;
//
// };
//
// function MovingObject () {}
//
// function Ship () {}
// Ship.inherits(MovingObject);
//
// function Asteroid () {}
// Asteroid.inherits(MovingObject);
//

Function.prototype.inherits = function (parent) {

  this.prototype = Object.create(parent.prototype);
  this.prototype.constructor = this; // this is still necessary!

};

function MovingObject () {}

function Ship () {}
Ship.inherits(MovingObject);

function Asteroid () {}
Asteroid.inherits(MovingObject);




//
// child.prototype = parent.prototype
// let bob = new Child();
// bob.__proto__ => child.prototype
// child.prototype.talk = {};

// We cannot do the above because now child.prototype and parent.prototype are pointing to the sam
// object, but we want child.prototype to have unique functions that don't exist on the parent.


// we also don't want the child.prototype to point to an instance of a parent class because
// we don't want to unnecessarily create a new parent object.

// Constructor only exists on prototypes and so the final assignemnt
// (this.prototype.constructor = this;) is saying what constructor this
// prototype is for. A prototype is associated with a constructor.
