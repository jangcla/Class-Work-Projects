const MovingObject = require("./moving_object.js")
const Util = require("./util.js")
const Asteroid = require("./asteroid.js")

const DIM_X = 1000
const DIM_Y = 1000
const NUM_ASTEROIDS = 50


class Game {
    constructor() {
        this.asteroids = [];
        this.addAsteroids()
    }
}
Game.prototype.addAsteroids = function () {
    while (this.asteroids.length !== NUM_ASTEROIDS) {
        this.asteroids.push(new Asteroid ({pos: this.randomPosition()}));
    }
}
Game.prototype.randomPosition = function () {
    let posx = Math.random() * DIM_X;
    let posy = Math.random() * DIM_Y;

    return [posx, posy];
}

Game.prototype.draw = function (ctx) {
    ctx.clearRect(0, 0, DIM_X, DIM_Y);

    for (let i = 0; i < this.asteroids.length; i++) {
        this.asteroids[i].draw(ctx);
    }
}

Game.prototype.moveObjects = function (ctx) {
    for (let i = 0; i < this.asteroids.length; i++) {
        this.asteroids[i].move(ctx);
    }
}

Game.prototype.wrap = function (pos) {
    if (pos[0] < 0) {
        pos[0] = 1000
    } else if (pos[1] < 0){
        pos[1] = 1000
    } else if (pos[0] > 1000) {
        pos[0] = 0
    } else {
        pos[1] = 0
    }
    return pos;
}


module.exports = Game;