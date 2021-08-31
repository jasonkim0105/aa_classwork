const MovingObject = require("./moving_object");
const Util = require("./util");

const DEFAULT = {
  COLOR: "#adacaa",
  RADIUS: 30,
  VEL: [
    (10 * Math.random()),
    (20 * Math.random())
  ]
};

function Asteroid(options) {
  options.color = DEFAULT.COLOR;
  options.radius = DEFAULT.RADIUS;
  options.vel = options.vel || DEFAULT.VEL;

  MovingObject.call(this, options);
};

Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;