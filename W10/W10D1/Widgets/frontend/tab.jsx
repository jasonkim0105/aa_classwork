import React from "react";

class Header extends React.Component {

  rende() {

    const headers = this.props.arr.map((tab, index) => {
      const title = tab.title;
      const selected = index === this.props.selected ? "active" : "";

      return (
        <li key={index} selected={selected}>
          {title}
        </li>
      )
    })

    return (
      <ul>
        {headers}
      </ul>
    )
  }
}


class Tab extends React.Component {
  constructor(props) {
    super(props);
    this.state = {selectedTab: 0};
  }

  render() {
    const selectedTab = this.props.arr[this.state.selectedTab]

    return (
      <div>
        <Header
          arr={this.props.arr}
          selected={this.state.selectedTab}

          
        />
        <div className="tab-content">
          {selectedTab.content}
        </div>
      </div>
    )
  }
}

export default Tab;