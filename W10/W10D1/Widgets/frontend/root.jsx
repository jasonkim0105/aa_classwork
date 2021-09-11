import Clock from "./clock";
import Tab from "./tab";
import React from "react";

let arr = [{title: 0, content: 0}, {title: 1, content: 1}, {title: 2, content: 2}];

const Root = () => {
    return (
        <div className="root">
          <Clock/>
          <Tab arr={arr}/>
        </div>
        )
}

export default Root;