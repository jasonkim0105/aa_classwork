import React from "react";
import ReactDOM from "react-dom";
import {signupUser, loginUser, logoutUser} from './util/session_api_util';
import createStore from "./store/store"

document.addEventListener("DOMContentLoaded", () => {

  const root = document.getElementById("root");
  
  let preloadedState = undefined;
  
  if (window.currentUser) {
    preloadedState = {
      session: {
        currentUser: window.currentUser
      }
    };
  }
  
  const store = createStore(preloadedState);
  window.signupUser = signupUser;
  window.loginUser = loginUser;
  window.logoutUser = logoutUser;
  
  window.getState = store.getState;

  ReactDOM.render(<h1>Welcome to BenchBnB</h1>, root);
});