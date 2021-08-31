/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const MovingObject = __webpack_require__(/*! ./moving_object */ \"./src/moving_object.js\");\nconst Util = __webpack_require__(/*! ./util */ \"./src/util.js\");\n\nconst DEFAULT = {\n  COLOR: \"#adacaa\",\n  RADIUS: 30,\n  VEL: [\n    (10 * Math.random()),\n    (20 * Math.random())\n  ]\n};\n\nfunction Asteroid(options) {\n  options.color = DEFAULT.COLOR;\n  options.radius = DEFAULT.RADIUS;\n  options.vel = options.vel || DEFAULT.VEL;\n\n  MovingObject.call(this, options);\n};\n\nUtil.inherits(Asteroid, MovingObject);\n\nmodule.exports = Asteroid;\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const MovingObject = __webpack_require__(/*! ./moving_object */ \"./src/moving_object.js\");\nconst Util = __webpack_require__(/*! ./util */ \"./src/util.js\");\nconst Asteroid = __webpack_require__(/*! ./asteroid */ \"./src/asteroid.js\");\n// const GameView = require(\"./game_view\");\n\nfunction Game(){\n  this.asteroids = [];\n\n  this.addAsteroids();\n};\n\nGame.DIM_X = 1000;\nGame.DIM_Y = 1000;\nGame.NUM_ASTEROIDS = 5;\n\nGame.prototype.addAsteroids = function addAsteroids() {\n  for (let i = 0; i < Game.NUM_ASTEROIDS; i++) {\n    let position = this.randomPosition();\n    const asteroid = new Asteroid ({ pos: position });\n    this.asteroids.push(asteroid);\n  }\n};\n\nGame.prototype.randomPosition = function randomPosition() {\n\n  return [\n    Math.floor(Game.DIM_X * Math.random()),\n    Math.floor(Game.DIM_Y * Math.random())\n  ];\n};\n\nGame.prototype.draw = function draw(ctx) {\n  ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y);\n  this.asteroids.forEach((asteroid) => {\n    asteroid.draw(ctx);\n  });\n}\n\nGame.prototype.moveObjects = function moveObjects() {\n  this.asteroids.forEach((asteroid) => {\n    asteroid.move();\n  });\n};\n\nGame.prototype.wrap = function wrap(pos) {\n\n}\n\nmodule.exports = Game;\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/***/ ((module) => {

eval("// const Game = require(\"./game\");\n\nfunction GameView (ctx, game) {\n  this.ctx = ctx;\n  this.game = game;\n}\n\nGameView.prototype.start = function start() {\n  setInterval(() => {\n    this.game.draw(this.ctx);\n    this.game.moveObjects();\n}, 20);\n}\n\nmodule.exports = GameView;\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/***/ ((__unused_webpack_module, __unused_webpack_exports, __webpack_require__) => {

eval("console.log(\"Webpack is working!\")\n\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\nconst Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\nconst GameView = __webpack_require__(/*! ./game_view.js */ \"./src/game_view.js\");\n\nwindow.addEventListener('DOMContentLoaded', () => {\n  const cir = document.getElementById(\"canvas\");\n  const ctx = cir.getContext(\"2d\");\n  window.ctx = ctx;\n\n  const mo = new MovingObject({\n    pos: [30, 30],\n    vel: [10, 10],\n    radius: 5,\n    color: \"#00FF00\"\n  });\n\n  // const ast = new Asteroid({ pos: [30, 30] });\n  // window.ast = ast;\n\n  const game = new Game();\n  window.game = game;\n\n  const gameView = new GameView(ctx, game).start();\n  window.gameView = gameView;\n\n});\n\nwindow.MovingObject = MovingObject;\nwindow.Game = Game;\nwindow.GameView = GameView;\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/***/ ((module) => {

eval("// const mo = new MovingObject({\n//   pos: [30, 30],\n//   vel: [10, 10],\n//   radius: 5,\n//   color: \"#00FF00\"\n// });\n\nfunction MovingObject(options) {\n\n  this.pos = options.pos;\n  this.vel = options.vel;\n  this.radius = options.radius;\n  this.color = options.color;\n}\n\nMovingObject.prototype.draw = function draw(ctx) {\n  ctx.fillStyle = this.color;\n\n  ctx.beginPath();\n  ctx.arc(\n    this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI\n  );\n  ctx.fill();\n}\n\nMovingObject.prototype.move = function move() {\n  this.pos = [\n    // this.pos[0] + (5 * Math.random()),\n    // this.pos[1] + (5 * Math.random())\n\n    this.pos[0] + this.vel[0],\n    this.pos[1] + this.vel[1]\n];\n};\n\n\n\n\n\nmodule.exports = MovingObject;\n\n\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/util.js":
/*!*********************!*\
  !*** ./src/util.js ***!
  \*********************/
/***/ ((module) => {

eval("const Util = {\n  inherits(childClass, parentClass) {\n    childClass.prototype = Object.create(parentClass.prototype);\n    childClass.prototype.constructor = childClass;\n  },\n  randomVec(length) {\n    const deg = 2 * Math.PI * Math.random();\n    return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n  },\n  scale(vec, m) {\n    return [vec[0] * m, vec[1] * m];\n  },\n  // wrap(pos) {\n\n  // }\n};\n\nmodule.exports = Util;\n\n//# sourceURL=webpack:///./src/util.js?");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module can't be inlined because the eval devtool is used.
/******/ 	var __webpack_exports__ = __webpack_require__("./src/index.js");
/******/ 	
/******/ })()
;