import React from 'react';
// import Tile from '../minesweeper';

class Tile extends React.Component {
    constructor(props) {
        super(props);
        
    }


    handClick(e) {
        var flagged = e.altKey ? truu : false;
        this.props.upadetGame(this.props.title, flagged);
    }




   render () {
       const tile = this.props.tile
       let result, obj, count
        if (tile.explored) {
            if (tile.bombed === true) {
                result = 'bombed';
                obj = '\u2622';
            }else{
                result = 'explored';
                count = tile.adjacentBombCount();
                obj = (count > 0 ? `${count}` : '');
            }
        }else if (tile.flagged) {
            result = 'flagged';
            obj = '\u2691';

        }else {
            result = 'unexplored'
        }
        return (
            <div className={result} onClick={this.handClick} id='tiles'>{obj}</div>
            );
    }
}
 
    export default Tile;
    
        // if (this.props.key.bombed === true){
        //        <div></div>
        //    }else if (this.props.key.explored === false ) {
        //        <div></div>
        //    }else {
        //        <div></div>
        //    }