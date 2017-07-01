const MovingObject = require('./moving_object.js');

const DEFAULTS = {
  COLOR: "#000000",
  RADIUS: 15,
  VEL: randomVec()
}

function Asteroid(color = "#000000", radius = 15, pos) {
  this.color = DEFAULTS[COLOR];
  this.radius = DEFAULTS[RADIUS];
  this.pos = pos;
  this.vel = DEFAULTS[VEL];
}

// Return a randomly oriented vector with the given length.
const randomVec = function randomVec (length) {
  const deg = 2 * Math.PI * Math.random();
  return Util.scale([Math.sin(deg), Math.cos(deg)], length);
},
// Scale the length of a vector by the given amount.
const scale = functon scale (vec, m) {
  return [vec[0] * m, vec[1] * m];
}


Util.inherits(Asteroid, MovingObject);


module.exports = Asteroid;
