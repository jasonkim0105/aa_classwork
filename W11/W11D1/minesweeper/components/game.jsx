import React from 'react';
import * as Minesweeper from "../minesweeper.js";
import Tile from "./tile.jsx";
import Board from "./board.jsx";


class Game extends React.Component {
  constructor(props) {
    super(props);
    const boardProp = new Minesweeper.Board(9, 5);
    this.state = {
      board: boardProp
    };
    this.updateGame= this.updateGame.bind(this);
  }

  updateGame() {
  }

  render() {
    return (
      <div><Board board={this.state.board} updateGame={this.updateGame}/></div>
    );
  }
}
export default Game;