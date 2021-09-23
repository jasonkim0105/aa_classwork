import {login} from '../../actions/session_action';
import {connect} from 'react-redux';
import React from 'react';
import SessionForm from './session_form'


const mapStateToProps = ({ errors }) => ({
  errors: errors.sessionErrors,
  formType: 'login',
})

const mapDispatchToProps = (dispatch) => ({
  processForm: (user => dispatch(login(user)))
})

export default connect(mapStateToProps, mapDispatchToProps)(SessionForm);