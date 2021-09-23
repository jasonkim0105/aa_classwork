import React from 'react';
import { Link } from 'react-router-dom';

const Greeting = (props) => {
  let greeting = null;
  if (props.currentUser) {
    greeting = (
      <div>
        <h2>Hi {props.currentUser.username}</h2>
        <button onClick={props.logout}>Log Out</button>
      </div>
    )
  } else {
    greeting = (
      <div>
        <Link to="/login">Login</Link>
        &nbsp;or&nbsp;
        <Link to="/signup">Sign up!</Link>
      </div>
    )
  }
  return greeting;
}


export default Greeting;