const MovingObject = require("./moving_object.js");
const Asteroid = require("./asteroid.js");
const Util = require("./util.js");
const Game = require("./game.js");
const GameView = require("./game_view.js")

window.addEventListener('DOMContentLoaded', (event) => {
    console.log('DOM fully loaded and parsed');
    window.MovingObject = MovingObject;

    const canvas = document.getElementById('game-canvas');
    const ctx = canvas.getContext('2d');
    canvas.height = 1000;
    canvas.width = 1000;
    
    // const mo = new MovingObject({
    //     pos: [100, 100],
    //     vel: [50, 50],
    //     radius: 50,
    //     color: "#00FF00"
    // });
    // mo.draw(ctx);
    // mo.move(ctx);
    // mo.draw(ctx);
    // mo.move(ctx);
    // mo.move(ctx);
    // mo.draw(ctx);
    // const ast = new Asteroid({ pos: [30, 30] });
    // ast.draw(ctx);
    //debugger
    let game = new Game();
    let gameView = new GameView(game, ctx);
    gameView.start();
});