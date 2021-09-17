import {connect} from "react-redux";
import { receiveStep } from "../../actions/receiveSteps";
import { stepsByTodoId } from "../../reducers/selectors";

const mapStateToProps = (state,todoid)=>{
  return{
    steps: stepsByTodoId(state,todoid)
  }
}

const MapDispatchToProps = (dispatch) => {
  return{
    receiveStep: (step)=>{dispatch(receiveStep(step))},
  }
}



export default connect(mapStateToProps, MapDispatchToProps)(TodoDetailView);