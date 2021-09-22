import React from 'react';
import { Link } from 'react-router-dom';

const Greeting = ({ currentUser, logout }) => (
  (
    <nav className="login-signup">
      <Link to="/login">Login</Link>
      &nbsp;or&nbsp;
      <Link to="/signup">Sign up!</Link>
    </nav>
  )
);


export default Greeting;