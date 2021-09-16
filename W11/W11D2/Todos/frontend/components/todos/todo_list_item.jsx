import React from "react";


class todoListItem extends React.Component{
  constructor(props){
    super(props)
  }
  render(){
    return(
      <ul>
        TITLE: {this.props.obj.title}
        <br />
        DONE: {this.props.obj.done.toString()}
        <br />
        <button onClick={() => {
          this.props.obj.done = !(this.props.obj.done);
          console.log(this.props.obj.done)
          this.props.receiveTodo(this.props.obj)
        }}>Done
        </button>
      </ul>
    )
  }
}

export default todoListItem;