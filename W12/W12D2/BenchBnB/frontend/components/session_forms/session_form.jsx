import React from 'react';
import { Link } from 'react-router-dom';

class SessionForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      username: '',
      password: ''
    };
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleSubmit(e) {
    e.preventDefault();
    const user = Object.assign({}, this.state);
    this.props.processForm(user);
  }

  update(field) {
    return (e) => this.setState({ [field]: e.target.value })
  }

  render() {
    let {errors, formType } = this.props
    return (
      <div>
        <h1> {formType} </h1>
        <form onSubmit={this.handleSubmit}>
          <label>Username:
            <input
              onChange={this.update('username')}
              type='text'
              value={this.state.username}
            />
          </label>
          <label>Password:
            <input
              onChange={this.update('password')}
              type='password'
              value={this.state.password}
            />
          </label>
          <button>{formType}</button>
          {formType === 'login' ? <Link to="/signup">Sign Up</Link> : <Link to="/login">Login</Link>}
        </form>
      </div>
    )
  }
}

export default SessionForm;