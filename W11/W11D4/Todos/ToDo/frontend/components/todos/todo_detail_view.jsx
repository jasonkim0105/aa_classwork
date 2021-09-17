import React from "react";

class TodoDetailView extends React.Component {

  constructor(props) {
    super(props);
  }
  render() {
    return(
      <div>
        <div>
        BODY: {this.props.obj.body}
        </div>
        <br />
        <button onClick= {() => {
          this.props.removeTodo(this.props.obj)
          }}>Remove Todo
        </button>
      </div>
    )
  }
}

export default TodoDetailView;