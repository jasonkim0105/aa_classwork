import {RECEIVE_STEPS, RECEIVE_STEP,REMOVE_STEP} from "./step_actions"

export const receiveSteps = (steps) => {
  return {
    type: RECEIVE_STEPS,
    steps
  };
};


export const receiveStep = (step) =>{
  return{
    type: RECEIVE_STEP,
    step
  }
}



export const removeStep = (step) =>{
  return{
    type: REMOVE_STEP,
    step
  }
}