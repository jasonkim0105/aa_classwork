import {RECEIVE_TODOS, RECEIVE_TODO,REMOVE_TODO} from "./todo_actions"
import * as ApiUtil from "../util/todo_api_util.js";

export const receiveTodos = (todos) => {
  return {
    type: RECEIVE_TODOS,
    todos
  };
};


export const receiveTodo = (todo) =>{
  return{
    type: RECEIVE_TODO,
    todo
  }
}



export const removeTodo = (todo) =>{
  return{
    type: REMOVE_TODO,
    todo
  }
}

export const fetchTodos = () => (dispatch) => {
  return ApiUtil.fetchTodos()
  .then(todos => dispatch(receiveTodos(todos)));
}

