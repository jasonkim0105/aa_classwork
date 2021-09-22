import { combineReducers } from "redux";
import sessionsReducer from "./session_reducer";


const rootReducer = combineReducers({
  session:sessionsReducer,
})


export default rootReducer