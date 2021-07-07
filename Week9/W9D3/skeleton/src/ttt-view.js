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
  
  bindEvents() {}

  handleClick(e) {}

  makeMove(square) {}

}



module.exports = View;
