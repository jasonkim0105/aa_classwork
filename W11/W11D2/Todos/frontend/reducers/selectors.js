

export const allTodos= (state) =>{
  let arr = Object.values(state.todos)
  return arr;
}