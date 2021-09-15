import { RECEIVE_TODO,RECEIVE_TODOS,REMOVE_TODO } from "../actions/todo_actions";

const initialState = {
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
};



const todosReducer = (state = initialState, action) => {
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