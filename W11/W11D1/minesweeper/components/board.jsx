import React from 'react';
import * as Minesweeper from "../minesweeper.js";
import Tile from "./tile.jsx";

class Board extends React.Component {
  constructor(props) {
    super(props)
  }
  render() {
    const grid = this.props.board.grid.map((row, i) => {
      return (
        <div className="row" key={i}>
          {row.map((tile, j) => {
            return <Tile tile={tile} updateGame={this.props.updateGame} key={[i, j]}/>
          })}
        </div>
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