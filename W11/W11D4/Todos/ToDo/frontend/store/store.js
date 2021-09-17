import { createStore, applyMiddleware } from "redux";
import rootReducer from "../reducers/root_reducer";
import thunk from 'redux-thunk';
import logger from 'redux-logger';
import myMiddleware from '../middleware/thunk.js';

const configureStore = (preloadedState = {}) =>{
  return createStore(rootReducer, preloadedState, applyMiddleware(myMiddleware, logger));
}

export default configureStore;