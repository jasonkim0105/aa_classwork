import { NEW_SESSION } from "../actions/session_action";

const _nullSession = {
  currentUser: null
}

const sessionsReducer = (state = _nullSession,action)=>{
  Object.freeze(state);
  switch(action.type){
    case NEW_SESSION:
      return Object.assign({},{currentUser: action.user})
    // case LOGOUT_CURRENT_USER:
    //   return _nullSession;
    default:
      return state;
  }
}

export default sessionsReducer;