import React from 'react';
import { Route } from 'react-router';
import GreetingContainer from "./greeting/greeting_container";
import LoginFormContainer from './session_forms/login_form_container'
import SignupFormContainer from './session_forms/signup_form_container'

const App = () => (
  <div>
    <header>
    <h1>Bench BnB</h1>
    <GreetingContainer />
    </header>

    <Route path="/login" component={LoginFormContainer}/>
    <Route path="/signup" component={SignupFormContainer}/>
  </div>
);

export default App;