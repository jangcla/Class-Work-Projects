import React from "react";
import Tile from "./tile"


class Board extends React.Component {
    constructor(props){
        super(props);
        this.renderRow = this.renderRow.bind(this)
        this.renderTiles = this.renderTiles.bind(this)
    }

    render() {
        const board = this.props.board
        return ( 
            <div>
                {this.renderRow()}
            </div>
        );
    }

    renderRow() {
        const board = this.props.board

        return board.grid.map((row, i) => {
            return (
                <div  id='rows'> 
                    {this.renderTiles(row, i)}
                </div>
            )
        })
    }

    renderTiles(row, i) {
        const board = this.props.board;
        return row.map((tile, j) => {
            return (
                <Tile
                key= { i+j }
                tile = { tile }
                updateGame =  { this.props.updateGame}
                />
            )
        })
    }

}

export default Board;