import {signup} from '../../actions/session_action';
import {connect} from 'react-redux';
import React from 'react';
import SessionForm from './session_form'

const mapStateToProps = ({ errors }) => ({
  errors: errors.sessionErrors,
  formType: 'signup',
})

const mapDispatchToProps = (dispatch) => ({
  processForm: (user => dispatch(signup(user)))
})

export default connect(mapStateToProps, mapDispatchToProps)(SessionForm);