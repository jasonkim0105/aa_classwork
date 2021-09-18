import { combineReducers } from "redux";
import entitiesReducer from "./entites_reducers";

const rootReducer = combineReducers({
    entities: entitiesReducer
  });
  export default rootReducer