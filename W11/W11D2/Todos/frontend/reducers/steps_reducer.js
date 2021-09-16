import { RECEIVE_STEPS,RECEIVE_STEP,REMOVE_STEP } from "../actions/step_actions";





const stepsReducer = (state = {}, action) => {
  Object.freeze(state);
  // const newNewState = Object.assign({}, state);
  switch (action.type) {
    case RECEIVE_STEPS:
      const arrayState = {};
        action.steps.forEach( (step) => {
          arrayState[step.id] = step;
        })
        return arrayState;
      break;
    case(RECEIVE_STEP):
        let newOBJ = {}
        newOBJ[action.step.id]=action.step;
        const addedState = Object.assign({},state,newOBJ);
        return addedState;
      break;

      case(REMOVE_STEP):
        const removeState = Object.assign({},state);
        delete removeState[action.step.id];
        return removeState;
      break;

    default:
      console.log(action.steps);
      return state;
  }
};

export default stepsReducer;