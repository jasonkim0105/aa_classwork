export const NEW_SESSION = "NEW_SESSION";
import {signupUser,loginUser,logoutUser} from "../util/session_api_util";


export const newSession = (user) => ({
  type: NEW_SESSION,
  user
});








export const createSession = user => dispatch => (
  loginUser(user).then( data => dispatch(newSession(data)))
);