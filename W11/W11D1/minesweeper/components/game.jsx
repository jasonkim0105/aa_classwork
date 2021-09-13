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

  updateGame(tileObj, flagging) {
    if (flagging) {
      tileObj.toggleFlag();
      this.setState({ board: this.state.board })
    } else {
      tileObj.explore();
      this.setState({ board: this.state.board })
    }
  }

  render() {
    return (
      <div>
        <Board board={this.state.board} updateGame={this.updateGame}/>
        <div className="alert">
          {this.state.board.won() ? "You won!" : ""}
          {this.state.board.lost() ? "You lost!" : ""}
        </div>
      </div>
    );
  }
}
export default Game;