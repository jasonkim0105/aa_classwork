import React from "react";
import TodoDetailView from "./todo_detail_view";


class todoListItem extends React.Component{
  constructor(props){
    super(props)
    this.state = {
      detail:false
    }
    this.toggleDetail = this.toggleDetail.bind(this)
  }

  toggleDetail(){
    let bool = !(this.state.detail)
    this.setState({detail:bool})
  }

  render(){

    if(this.state.detail){
      return(
            <ul>
              <div onClick={()=>{this.toggleDetail()}}>
              TITLE: {this.props.obj.title}
              </div>
              <br />
              DONE: {this.props.obj.done.toString()}
              <br />
              <button onClick={() => {
                this.props.obj.done = !(this.props.obj.done);
                console.log(this.props.obj.done)
                this.props.receiveTodo(this.props.obj)
              }}>Done
              </button>
              <TodoDetailView obj={this.props.obj}/>
            </ul>
          )
    }else{
      return(
            <ul>
              <div onClick={()=>{
              this.toggleDetail()
              }}>
                TITLE: {this.props.obj.title}
              </div>
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
}

export default todoListItem;