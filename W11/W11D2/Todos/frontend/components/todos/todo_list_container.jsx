import { connect } from "react-redux";
import { receiveTodo } from "../../actions/receiveTodos";
import { removeTodo } from "../../actions/receiveTodos";
import { allTodos } from "../../reducers/selectors";
import todo_list from "./todo_list";


const mapStateToProps = (state)=>{
   return{
     todos: allTodos(state)
   }
}

const mapDispatchToProps = (dispatch) =>{
  return {
    receiveTodo: (todo) => dispatch(receiveTodo(todo)),
    removeTodo: (todo) => dispatch(removeTodo(todo))
  }
}


export default connect(mapStateToProps,mapDispatchToProps)(todo_list)



//<todo_list todos:alltodos(state)  receieveTodo:/>