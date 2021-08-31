class View {
  constructor(game, el) {
    this.game = game;
    this.el = el;
    this.setupBoard();
  }

  setupBoard() {
    const ul = document.createElement("ul");
    // const li = document.createElement("li");
    for (let i = 0; i < 9; i++){
      let li = document.createElement("li");
      li.setAttribute("data-pos", i);
      li.style.display = "inline-block";
      li.style.width = "50px";
      li.style.height = "50px";
      li.style.borderStyle = "solid";
      li.style.background = "gray";
      li.style.borderWidth = "1px";
      ul.append(li);
    }
    this.el.append(ul);
    ul.style.display = "flex";
    ul.style.width = "159px";
    ul.style.flexWrap = "wrap";
    ul.addEventListener("mouseover", (e) => {
      let ele = e.target;
      ele.style.background = "yellow";
    });
    ul.addEventListener("mouseout", (e) => {
      let ele = e.target;
      ele.style.background = "gray";
    });

  }

  bindEvents() {}

  handleClick(e) {}

  makeMove(square) {}

}


module.exports = View;
