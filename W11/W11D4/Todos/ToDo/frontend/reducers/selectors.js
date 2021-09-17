

export const allTodos= (state) =>{
  let arr = Object.values(state.todos)
  return arr;
}

export const stepsByTodoId= (state,todoId)=>{
  let arr = Object.values(state.steps);
  let filteredArr = []
  arr.forEach((ele)=>{
    if(ele.id === todoId){
      filteredArr.push(ele)
    }
  })
  return filteredArr

}