import {connect} from "react-redux";
import { receiveSteps } from "../../actions/receiveSteps";
import { removeTodo } from "../../actions/receiveTodos";

const MapDispatchToProps = (dispatch) => {
  return{
    receiveSteps: (todo)=>{dispatch(receiveSteps(todo))},
    removeTodo: (todo) => {dispatch(removeTodo(todo))}
  }
}



export default connect(null, MapDispatchToProps)(TodoDetailView);