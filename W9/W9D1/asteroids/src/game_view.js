// const Game = require("./game");

function GameView (ctx, game) {
  this.ctx = ctx;
  this.game = game;
}

GameView.prototype.start = function start() {
  setInterval(() => {
    this.game.draw(this.ctx);
    this.game.moveObjects();
}, 20);
}

module.exports = GameView;