import React from 'react';
import * as Minesweeper from "../minesweeper.js";
import Tile from "./tile.jsx";

class Board extends React.Component {
  constructor(props) {
    super(props)
  }
  render() {
    const grid = this.props.board.grid.map((row, index) => {
      return(
      <div><Tile /></div>
      )
    })
    return (

      <div>
        {grid}
      </div>
    )
  }
}

export default Board;