import React from "react"
import ReactDOM from "react-dom";
import Root from "./root"

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  const welcomeMessage = <h1>Hello World</h1>;
  ReactDOM.render(<Root/>, root)
})