import { RECEIVE_ALL_POKEMON } from '../actions/pokemon_actions';

const pokemonReducer = (oldState = {}, action) => {
    Object.freeze(oldState);
    switch (action.type){
        case (RECEIVE_ALL_POKEMON):
            let newState = Object.assign({}, action.pokemon);
            return newState;
        default:
            return oldState
    }
}



export default pokemonReducer