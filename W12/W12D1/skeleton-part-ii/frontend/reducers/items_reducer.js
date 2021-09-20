import { RECEIVE_POKEMON } from "../actions/pokemon_actions"

const itemsReducer = (state ={}, action) => {
    Object.freeze(state)
    // let newState = Object.assign({}, state)
    // debugger
    switch(action.type){
        case RECEIVE_POKEMON:
            let newState = Object.assign({}, state, action.payload.items )
            return newState;
        default:
            return state
    }
}

export default itemsReducer