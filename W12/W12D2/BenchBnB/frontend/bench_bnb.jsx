import React from "react";
import ReactDOM from "react-dom";
import {signupUser, loginUser, logoutUser} from './util/session_api_util';

document.addEventListener("DOMContentLoaded", () => {
  window.signupUser = signupUser;
  window.loginUser = loginUser;
  window.logoutUser = logoutUser;


  const root = document.getElementById("root");
  ReactDOM.render(<h1>Welcome to BenchBnB</h1>, root);
});