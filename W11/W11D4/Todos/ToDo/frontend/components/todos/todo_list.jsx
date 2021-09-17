import React from "react";
import TodoListItem from "./todo_list_item";
import TodoForm from "./todo_form"

class TodoList extends React.Component{
  constructor(props){
    super(props)
  }

  render(){
    console.log(this.props.removeTodo)
    return(
      <div className="todoList">
        <ul>
          {this.props.todos.map((ele,idx)=>{
            return (
              <li key={idx}>
                <TodoListItem obj={ele} receiveTodo={this.props.receiveTodo} removeTodo={this.props.removeTodo}/>
              </li>
            )
          })}
        </ul>
        <TodoForm receiveTodo={this.props.receiveTodo}/>
      </div>
    )
  }
}

export default TodoList;