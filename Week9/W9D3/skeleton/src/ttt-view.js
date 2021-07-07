class View {
  constructor(game, mark) {
    this.game = game,
    this.mark = mark,
    this.setupBoard()
  }

  setupBoard() {
    const ul = document.createElement('ul');

    for (let col = 0; col < 3; col++) {
      for (let row = 0; row < 3; row++) {
        const box = document.createElement("li");
        box.dataset.pos = JSON.stringify([col, row]),
        ul.append(box)
      }
      this.mark.append(ul)
    }
    
  }
  
  bindEvents() {
    this.mark.addEventListener("click", this.handleClick)
  }

  handleClick(e) {
    const ck = e.target
    if (ck.nodeName === "LI") {
      this.makeMove(ck);
    }
  }

  makeMove(square) {
    const pos = JSON.parse(square.dataset.pos)
    const cPlayer = this.game.currentPlayer;

    if (this.game.board.isEmptyPosition(pos)) {
      this.game.playMove(pos);
    } else {
      alert("This is not a valid move")
    }
    square.classList.add(cPlayer)
    if (this.game.isOver()) {
      this.handleGameOver()
    }
  }

  handleGameOver() {
    this.mark.removeEventListener("click", this.handleClick)
    this.mark.classList.add("game-over");
    const winner = this.game.winner()
    ele = document.createElement("figcaption");
    winner ? (this.mark.classList.add(`winner-${winner}`), ele.append(`You win, ${winner}!`)) : ele.append("It's a draw!"), this.mark.append(ele)
  }

}



module.exports = View;
