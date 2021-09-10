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

    function convertTime(num) {
      return (num < 10) ? `0${num}` : num;
    }

    return (
      <div className="clockContainer">
        <div className="timeContainer"><p>Time: </p>
        <span className="clock">{convertTime(hour)}:{convertTime(minute)}:{convertTime(second)}</span>
        </div>
        <div className="timeContainer"><p>Date: </p>
        <span>{this.state.date.getDate()}</span>
        </div>
      </div>

    )
  }

  componentDidMount() {
    this.interval = setInterval(this.tick, 1000)
  }

  componentWillUnmount() {
    clearInterval(this.interval);
  }
}

export default Clock;