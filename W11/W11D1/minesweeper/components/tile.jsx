import React from 'react';
import * as Minesweeper from "../minesweeper.js";

class Tile extends React.Component {
  constructor(props) {
    super(props);
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick(e) {
    this.props.updateGame(this.props.tile, e.altKey);
  }

  render() {
    const tile = this.props.tile;
    let symbol;
    let klass = "";

    if (tile.explored) {
      klass = "explored"
      if (tile.bombed) {
        klass = "bombed";
        symbol = "\u2622";// bomb symbol
      } else if (tile.adjacentBombCount()) {
        symbol = `${tile.adjacentBombCount()}`;
      } else {
        symbol = "";
      }
    } else if (tile.flagged) {
      klass = "flagged"
      symbol = "\u2691";
    } else {
      klass = "unexplored"
      symbol = "";
    }

    return (
      <div className={`tile-${klass}`} onClick={this.handleClick}>{symbol}</div>
    )
  }
}

export default Tile;