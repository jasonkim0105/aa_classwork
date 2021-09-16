import React from "react";
import ReactDOM from "react-dom";
import configureStore from "./store/store.js"
import {receiveTodos, receiveTodo,removeTodo} from "./actions/receiveTodos.js"
import {receiveSteps, receiveStep,removeStep} from "./actions/receiveSteps.js"
import { allTodos } from "./reducers/selectors.js";
import App from "./components/app"
import Root from "./components/root"

// const initialState = {
//   1: { // this is the step with id = 1
//     id: 1,
//     title: 'walk to store',
//     done: false,
//     todo_id: 1
//   },
//   2: { // this is the step with id = 2
//     id: 2,
//     title: 'buy soap',
//     done: false,
//     todo_id: 1
//   }
// }
document.addEventListener("DOMContentLoaded",()=>{
  const initialState = {
    todos: {
      1: {
        id: 1,
        title: "wash car",
        body: "with soap",
        done: false
      },
      2: {
        id: 2,
        title: "wash dog",
        body: "with shampoo",
        done: true
      }
    },
    steps: {
      1: { // this is the step with id = 1
        id: 1,
        title: 'walk to store',
        done: false,
        todo_id: 1
      },
      2: { // this is the step with id = 2
        id: 2,
        title: 'buy soap',
        done: false,
        todo_id: 1
      }
    }
  };
  const store = configureStore(initialState)
  store.configureStore = configureStore

  window.store = store;
  window.receiveTodo = receiveTodo;
  window.receiveTodos = receiveTodos;
  window.removeTodo = removeTodo;

  window.allTodos = allTodos;


  window.receiveStep = receiveStep;
  window.receiveSteps = receiveSteps;
  window.removeStep = removeStep;


  console.log("added")

  const root = document.getElementById("root")



  ReactDOM.render(<Root store={store}/>,root);



})