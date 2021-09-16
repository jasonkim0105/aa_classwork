import React from "react"
import ToDoListContainer from "./todos/todo_list_container";

class App extends React.Component{
  render(){
    return(
      <div>
        <h1>Todo List HELLLOOOOO</h1>
        <ToDoListContainer/>
      </div>
    )
  }
}

export default App;