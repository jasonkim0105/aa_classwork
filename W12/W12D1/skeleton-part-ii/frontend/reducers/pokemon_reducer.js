import { RECEIVE_ALL_POKEMON, RECEIVE_POKEMON } from './../actions/pokemon_actions';


const pokemonReducer = (state = {}, action) => {
  Object.freeze(state);
  switch (action.type){
  case RECEIVE_ALL_POKEMON:
    return Object.assign({}, state, action.pokemon);
  case RECEIVE_POKEMON:
    let newState = {}
    newState[action.payload.pokemon.id] = action.payload.pokemon 
    // let newState = Object.assign({}, action.pokemon);
    // newState = action.pokemon;
    return newState;
  default:
    return state;
  }
}
  
export default pokemonReducer;
