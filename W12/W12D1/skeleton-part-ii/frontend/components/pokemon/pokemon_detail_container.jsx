import {connect} from 'react-redux';
import PokemonDetail from './pokemon_detail';
import {requestSinglePokemon} from './../../actions/pokemon_actions'

const mapStateToProps = (state, ownProps) => ({
  pokemon: state.entities.pokemon[ownProps.match.params.id],
  items: state.entities.pokemon[ownProps.match.params.id.moves],
  moves:
})

const mapDispatchToProps = (dispatch) => ({
  requestSinglePokemon: (pokemonId) => dispatch(requestSinglePokemon(pokemonId))
})

export default connect(mapStateToProps, mapDispatchToProps)(PokemonDetail)