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

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\")\nconst Util = __webpack_require__(/*! ./util.js */ \"./src/util.js\")\n\nconst def = {\n    COLOR: \"#000000\",\n    RADIUS: 45,\n}\n\nclass Asteroid extends MovingObject {\n    constructor (obj) {\n        super(obj);   \n        this.pos = obj.pos;\n        this.color = def.COLOR;\n        this.radius = def.RADIUS;\n        this.vel = Util.randomVec(2)\n        this.game = obj.game;\n    }\n}\n\n\nmodule.exports = Asteroid;\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\")\nconst Util = __webpack_require__(/*! ./util.js */ \"./src/util.js\")\nconst Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\")\n\nconst DIM_X = 1000\nconst DIM_Y = 1000\nconst NUM_ASTEROIDS = 50\n\n\nclass Game {\n    constructor() {\n        this.asteroids = [];\n        this.addAsteroids()\n    }\n}\nGame.prototype.addAsteroids = function () {\n    while (this.asteroids.length !== NUM_ASTEROIDS) {\n        this.asteroids.push(new Asteroid ({pos: this.randomPosition()}));\n    }\n}\nGame.prototype.randomPosition = function () {\n    let posx = Math.random() * DIM_X;\n    let posy = Math.random() * DIM_Y;\n\n    return [posx, posy];\n}\n\nGame.prototype.draw = function (ctx) {\n    ctx.clearRect(0, 0, DIM_X, DIM_Y);\n\n    for (let i = 0; i < this.asteroids.length; i++) {\n        this.asteroids[i].draw(ctx);\n    }\n}\n\nGame.prototype.moveObjects = function (ctx) {\n    for (let i = 0; i < this.asteroids.length; i++) {\n        this.asteroids[i].move(ctx);\n    }\n}\n\nGame.prototype.wrap = function (pos) {\n    if (pos[0] < 0) {\n        pos[0] = 1000\n    } else if (pos[1] < 0){\n        pos[1] = 1000\n    } else if (pos[0] > 1000) {\n        pos[0] = 0\n    } else {\n        pos[1] = 0\n    }\n    return pos;\n}\n\n\nmodule.exports = Game;\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\")\nconst Util = __webpack_require__(/*! ./util.js */ \"./src/util.js\")\nconst Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\")\nconst Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\")\n\nclass GameView {\n    constructor(game, ctx) {\n        this.game = game;\n        this.ctx = ctx;\n    }\n}\n\nGameView.prototype.start = function() {\n    let game = this.game;\n    let ctx = this.ctx;\n    setInterval(function () {\n        game.moveObjects(ctx);\n        game.draw(ctx);\n    }, 20);\n}\n\nmodule.exports = GameView;\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/***/ ((__unused_webpack_module, __unused_webpack_exports, __webpack_require__) => {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\nconst Util = __webpack_require__(/*! ./util.js */ \"./src/util.js\");\nconst Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\nconst GameView = __webpack_require__(/*! ./game_view.js */ \"./src/game_view.js\")\n\nwindow.addEventListener('DOMContentLoaded', (event) => {\n    console.log('DOM fully loaded and parsed');\n    window.MovingObject = MovingObject;\n\n    const canvas = document.getElementById('game-canvas');\n    const ctx = canvas.getContext('2d');\n    canvas.height = 1000;\n    canvas.width = 1000;\n    \n    // const mo = new MovingObject({\n    //     pos: [100, 100],\n    //     vel: [50, 50],\n    //     radius: 50,\n    //     color: \"#00FF00\"\n    // });\n    // mo.draw(ctx);\n    // mo.move(ctx);\n    // mo.draw(ctx);\n    // mo.move(ctx);\n    // mo.move(ctx);\n    // mo.draw(ctx);\n    // const ast = new Asteroid({ pos: [30, 30] });\n    // ast.draw(ctx);\n    //debugger\n    let game = new Game();\n    let gameView = new GameView(game, ctx);\n    gameView.start();\n});\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/***/ ((module) => {

eval("class MovingObject {\n    constructor(obj) {\n        this.pos = obj.pos;\n        this.vel = obj.vel;\n        this.radius = obj.radius;\n        this.color = obj.color;\n        this.game = obj.game;\n    }\n}\nMovingObject.prototype.draw = function (ctx) {\n    ctx.fillStyle = this.color;\n    ctx.beginPath();\n    ctx.arc(this.pos[0],this.pos[1], this.radius, 0, 2 * Math.PI, true);\n    ctx.fill();\n\n};\n\nMovingObject.prototype.move = function () {\n    let game = this.game;\n    this.pos[0] += this.vel[0];\n    this.pos[1] += this.vel[1];\n    this.pos = game.wrap(this.pos);\n};\n\nmodule.exports = MovingObject;\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/util.js":
/*!*********************!*\
  !*** ./src/util.js ***!
  \*********************/
/***/ ((module) => {

eval("const Util = {\n    inherits: function inherits(childClass, parentClass) {\n        //...\n        childClass.prototype = Object.create(parentClass.prototype);\n        childClass.prototype.constructor = childClass\n\n    }, \n    randomVec(length) {\n        const deg = 2 * Math.PI * Math.random();\n        return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n    },\n    // Scale the length of a vector by the given amount.\n    scale(vec, m) {\n        return [vec[0] * m, vec[1] * m];\n    }\n};\n\nmodule.exports = Util;\n\n//# sourceURL=webpack:///./src/util.js?");

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