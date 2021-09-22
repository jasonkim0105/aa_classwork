import React from "react";
import ReactDOM from "react-dom";
import Root from "./components/root";
import {signupUser, loginUser, logoutUser} from './util/session_api_util';
import configureStore from './store/store';
import {login, logout, signup } from './actions/session_action';


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
  window.login = login;
  window.logout = logout;
  window.signup = signup;

  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store} />, root);
});