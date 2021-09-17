import { combineReducers } from 'redux';
import {pokemonReducer} from "./pokemon_reducer"
import {movesReducer } from "./moves_reducer"
import {itemsReducer} from "./item_reducer"

const entities = combineReducers({
  pokemon: pokemonReducer,
  moves: movesReducer,
  items: itemsReducer
})

export default entities
