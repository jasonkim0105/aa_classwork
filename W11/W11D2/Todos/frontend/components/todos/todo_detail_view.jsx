import React from "react";

class TodoDetailView extends React.Component {

  constructor(props) {
    super(props);
  }
  render() {
    return(
      <div>
        hi
        <button onClick= {() => {
          this.props.removeTodo(this.props.obj)
          }}>Remove Todo
        </button>
      </div>
    )
  }
}