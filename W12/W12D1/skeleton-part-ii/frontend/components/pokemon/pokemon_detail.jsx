import React from "react";

class PokemonDetail extends React.Component{

  componentDidMount() {
    this.props.requestSinglePokemon(this.props.match.params.id);
  }

  render(){
    return (
      <div>
        <ul>
            <li>
              Type: {this.props.pokemon.pokeType}
            </li>
            <li>
              Attack: {this.props.pokemon.attack}
            </li>
            <li>
              Defense: {this.props.pokemon.defense}
            </li>
            <li>
              Moves: {this.props.moves}
            </li>
        </ul>
      </div>
    )
  }

}

export default PokemonDetail;