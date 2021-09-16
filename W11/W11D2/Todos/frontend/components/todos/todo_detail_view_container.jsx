import {connect} from "react-redux";
import { removeTodo } from "../../actions/receiveTodos";

const MapDispatchToProps = (dispatch) {
  return {
    removeTodo: (todo) => {
      dispatch(removeTodo(todo))
    }
  }
}
export default connect(null, MapDispatchToProps)(TodoDetailView);