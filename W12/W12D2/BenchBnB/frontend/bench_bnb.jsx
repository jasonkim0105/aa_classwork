import React from "react";
import ReactDOM from "react-dom";
import Root from "./components/root";
import {signupUser, loginUser, logoutUser} from './util/session_api_util';
// import Root from './components/root';
import configureStore from './store/store';


document.addEventListener("DOMContentLoaded", () => {
  let preloadedState = undefined;
  if (window.currentUser) {
    preloadedState = {
      session: { id: window.currentUser.id },
      entities: {
        users: { [window.currentUser.id]: window.currentUser }
      }
    };
  }

  const store = configureStore(preloadedState);
  window.signupUser = signupUser;
  window.loginUser = loginUser;
  window.logoutUser = logoutUser;
  window.getState = store.getState;

  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store} />, root);
});