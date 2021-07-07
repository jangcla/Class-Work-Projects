const MovingObject = require("./moving_object.js")
const Util = require("./util.js")
const Asteroid = require("./asteroid.js")
const Game = require("./game.js")

class GameView {
    constructor(game, ctx) {
        this.game = game;
        this.ctx = ctx;
    }
}

GameView.prototype.start = function() {
    let game = this.game;
    let ctx = this.ctx;
    setInterval(function () {
        game.moveObjects(ctx);
        game.draw(ctx);
    }, 20);
}

module.exports = GameView;