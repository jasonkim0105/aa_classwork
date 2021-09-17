import { RECEIVE_TODO,RECEIVE_TODOS,REMOVE_TODO } from "../actions/todo_actions";





const todosReducer = (state = {}, action) => {
  Object.freeze(state);
  // const newNewState = Object.assign({}, state);
  switch (action.type) {
    case RECEIVE_TODOS:
      const arrayState = {};
        action.todos.forEach( (todo) => {
          arrayState[todo.id] = todo;
        })
        return arrayState;
      break;
    case(RECEIVE_TODO):
        let newOBJ = {}
        newOBJ[action.todo.id]=action.todo;
        const addedState = Object.assign({},state,newOBJ);
        return addedState;
      break;

      case(REMOVE_TODO):
        const removeState = Object.assign({},state);
        delete removeState[action.todo.id];
        return removeState;
      break;



    default:
      console.log(action.todos);
      return state;
  }
};

export default todosReducer;