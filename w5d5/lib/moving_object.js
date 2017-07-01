function MovingObject(options) {
  const {pos, vel, radius, color} = options;
  this.pos = pos;
  this.vel = vel;
  this.radius = radius;
  this.color = color;
}

MovingObject.prototype.draw = function(ctx) {
  ctx.fillStyle = this.color;
ctx.beginPath();

ctx.arc(
  this.pos[0],
  this.pos[1],
  this.radius,
  0,
  2 * Math.PI,
  false
);

ctx.fill();
};

MovingObject.prototype.move = function() {
  this.pos[0] += this.vel[0];
  this.pos[1] += this.vel[1];

};



module.exports = MovingObject;

const mo = new MovingObject(
  { pos: [30, 30], vel: [10, 10], radius: 5, color: "#00FF00"}
);
