import React from "react";

class Clock extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      date: new Date()
    }
    this.tick = this.tick.bind(this);
  }

  tick() {
    this.setState({date: new Date()})
  }

  render() {
    let hour = this.state.date.getHours();
    let minute = this.state.date.getMinutes();
    let second = this.state.date.getSeconds();

    return (
      <h1>{hour}:{minute}:{second}</h1>
    )
  }

  componentDidMount() {
    const interval = setInterval(this.tick, 1000)
  }

  componentWillUnmount() {
    
  }
}

export default Clock;