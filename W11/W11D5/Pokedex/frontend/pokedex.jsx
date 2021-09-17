import React from "react";
import ReactDOM from "react-dom";
import {receiveAllPokemon} from "./actions/pokemon_actions";
import {fetchAllPokemon} from "./util/api_util";

document.addEventListener("DOMContentLoaded", () => {

  window.receiveAllPokemon = receiveAllPokemon;
  window.fetchAllPokemon = fetchAllPokemon;

  const rootEl = document.getElementById('root');
  ReactDOM.render(<h1>Pokedex test</h1>, rootEl);
})