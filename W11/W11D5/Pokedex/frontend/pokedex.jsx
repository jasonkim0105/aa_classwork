import React from "react";
import ReactDOM from "react-dom";
import {receiveAllPokemon, requestAllPokemon} from "./actions/pokemon_actions";
import {fetchAllPokemon} from "./util/api_util";
import configureStore from './store/store'
import {selectAllPokemon} from './reducers/selectors'

document.addEventListener("DOMContentLoaded", () => {

  window.receiveAllPokemon = receiveAllPokemon;
  window.fetchAllPokemon = fetchAllPokemon;
  const store = configureStore();
  window.store = store;
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  window.requestAllPokemon = requestAllPokemon;
  window.selectAllPokemon = selectAllPokemon;
  const rootEl = document.getElementById('root');
  ReactDOM.render(<h1>Pokedex test</h1>, rootEl);
})