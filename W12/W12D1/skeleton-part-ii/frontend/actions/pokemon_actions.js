import * as APIUtil from '../util/api_util';

export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON";
export const RECEIVE_POKEMON = 'RECEIVE_POKEMON';


const receiveAllPokemon = (pokemon) => ({
  type: RECEIVE_ALL_POKEMON,
  pokemon
})

const receivePokemon = (payload) => {
  return{
    type: RECEIVE_POKEMON,
    payload

  }
}


export const requestAllPokemon = () => (dispatch) => (
  APIUtil.fetchAllPokemon()
    .then(pokemon => dispatch(receiveAllPokemon(pokemon)))
)

export const requestSinglePokemon = (pokemonId) => dispatch => {
  APIUtil.fetchPokemon(pokemonId).then(pokemon => dispatch(receivePokemon(pokemon)))
}