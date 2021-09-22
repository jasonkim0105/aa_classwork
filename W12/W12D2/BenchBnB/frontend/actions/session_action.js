import * as APIUtil from '../util/session_api_util';

// export const NEW_SESSION = "NEW_SESSION";
export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER';
export const LOGOUT_CURRENT_USER = 'LOGOUT_CURRENT_USER';
export const RECEIVE_SESSION_ERRORS = 'RECEIVE_SESSION_ERRORS';

export const receiveCurrentUser = currentUser => ({
  type: RECEIVE_CURRENT_USER,
  currentUser
});

export const logoutCurrentUser = currentUser => ({
  type: LOGOUT_CURRENT_USER,
});

export const receiveErrors = errors => ({
  type: RECEIVE_SESSION_ERRORS,
  errors,
});

export const login = (user) => dispatch => (
  APIUtil.loginUser(user)
  .then((user) => dispatch(receiveCurrentUser(user)), err => dispatch(receiveErrors(err.responseJSON)))
)

export const logout = () => dispatch => (
  APIUtil.logoutUser()
  .then((user) => (dispatch(logoutCurrentUser())))
)

export const signup = user => dispatch => (
  APIUtil.signupUser(user)
  .then((user) => dispatch(receiveCurrentUser(user)), err => dispatch(receiveErrors(err.responseJSON)))
)









export const createSession = user => dispatch => (
  loginUser(user).then( data => dispatch(newSession(data)))
);