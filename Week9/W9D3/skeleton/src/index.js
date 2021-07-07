const View = require("./ttt-view.js")
const Game = require("../ttt_node/game.js")

document.addEventListener("DOMContentLoaded", () => {
  const gm = new Game();
  const el = document.querySelector('.ttt')
  const vw = new View(gm, el); 
});
