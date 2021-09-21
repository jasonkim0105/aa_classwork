import { postUser, postSession, deleteSession } from '../utils/session';

export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER';
export const LOGOUT_CURRENT_USER = 'LOGOUT_CURRENT_USER';
export const LOGIN_CURRENT_USER = 'LOGIN_CURRENT_USER'

const receiveCurrentUser = user => ({
  type: RECEIVE_CURRENT_USER,
  user
});

const loginCurrentUser = user => ({
  type: LOGIN_CURRENT_USER,
  user
})

const logoutCurrentUser = () => ({
  type: LOGOUT_CURRENT_USER,
});

export const createNewUser = formUser => dispatch => postUser(formUser).then(user => dispatch(receiveCurrentUser(user)));

export const login = formUser => dispatch => postSession(formUser).then(user => dispatch(receiveCurrentUser(user)));

export const logout = () => dispatch => deleteSession().then(() => dispatch(logoutCurrentUser()));