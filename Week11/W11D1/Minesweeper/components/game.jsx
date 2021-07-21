import React from "react";
import * as Minesweeper from "../minesweeper";
import Board from "./board";

class Game extends React.Component {
    constructor(props) {
        super(props);
        const board = new Minesweeper.Board(5, 2)
        this.state = {
            board: board
        }
        this.updateGame = this.updateGame.bind(this)

    }

    updateGame(){
        
    }

    render() {

        return(
            <div id='board'>
                <Board
                    board = { this.state.board }
                    updateGame = { this.updateGame }
                />
            </div>
        )
    }

}

export default Game;
//     "react-addons-css-transition-group": "^15.6.2",