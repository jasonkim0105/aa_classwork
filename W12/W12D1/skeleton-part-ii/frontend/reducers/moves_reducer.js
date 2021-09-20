import { RECEIVE_POKEMON } from "../actions/pokemon_actions"

const movesReducer = (state ={}, action) => {
    Object.freeze(state)
    switch(action.type){
        case RECEIVE_POKEMON:
            let newState = Object.assign({}, state, action.payload.moves)
            return newState;
        default: 
            return state;
    }
}

export default movesReducer;