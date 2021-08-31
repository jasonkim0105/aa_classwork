const MovingObject = require("./moving_object");
const Util = require("./util");
const Asteroid = require("./asteroid");
// const GameView = require("./game_view");

function Game(){
  this.asteroids = [];

  this.addAsteroids();
};

Game.DIM_X = 1000;
Game.DIM_Y = 1000;
Game.NUM_ASTEROIDS = 5;

Game.prototype.addAsteroids = function addAsteroids() {
  for (let i = 0; i < Game.NUM_ASTEROIDS; i++) {
    let position = this.randomPosition();
    const asteroid = new Asteroid ({ pos: position });
    this.asteroids.push(asteroid);
  }
};

Game.prototype.randomPosition = function randomPosition() {

  return [
    Math.floor(Game.DIM_X * Math.random()),
    Math.floor(Game.DIM_Y * Math.random())
  ];
};

Game.prototype.draw = function draw(ctx) {
  ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y);
  this.asteroids.forEach((asteroid) => {
    asteroid.draw(ctx);
  });
}

Game.prototype.moveObjects = function moveObjects() {
  this.asteroids.forEach((asteroid) => {
    asteroid.move();
  });
};

Game.prototype.wrap = function wrap(pos) {

}

module.exports = Game;