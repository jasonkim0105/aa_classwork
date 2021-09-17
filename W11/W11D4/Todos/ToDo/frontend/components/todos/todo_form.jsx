import React from "react"

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      id: Math.floor(Math.random() * 1000),
      title: "",
      body: "",
      done: false
    }

    this.updateTitle = this.updateTitle.bind(this);
    this.updateBody = this.updateBody.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    console.log(this.props)
  }

  updateTitle(e) {
    // console.log(e.target.value);
    this.setState({title:e.target.value})
  }

  updateBody(e) {
    // console.log(e.target.value);
    this.setState({body: e.target.value})
  }
  handleSubmit(e) {
    e.preventDefault();
    // console.log(this.props);
    this.props.receiveTodo(this.state);
  }

  render() {
    // console.log(this.props)
    return (
      <form onSubmit={this.handleSubmit}>
        <label>Title:
          <input type="text" value={this.state.title} onChange={this.updateTitle}/>
        </label>
        <label>Body:
          <input type="text" value={this.state.body} onChange={this.updateBody}/>
        </label>
        <input type = "submit" value = "add todo"/>
      </form>
    )
  }
}

export default TodoForm;