class View {
  constructor(game, el) {
    this.game = game;
    this.el = el;
    this.setupBoard();
    this.bindEvents();
  }

  setupBoard() {
    const ul = document.createElement("ul");
    // const li = document.createElement("li");
    for (let row = 0; row < 3; row++){
      for (let col = 0; col < 3; col++){
        let li = document.createElement("li");
        li.setAttribute("data-pos", JSON.stringify([row, col]));
        li.style.display = "inline-block";
        li.style.width = "50px";
        li.style.height = "50px";
        li.style.borderStyle = "solid";
        li.style.background = "gray";
        li.style.borderWidth = "2px";
        ul.append(li);
      }
      
    }
    this.el.append(ul);
    ul.style.display = "flex";
    ul.style.width = "162px";
    ul.style.flexWrap = "wrap";
    ul.setAttribute("id", "grid");

    //Hover listeners
    ul.addEventListener("mouseover", (e) => {
      let ele = e.target;
      ele.style.background = "yellow";
    });
    ul.addEventListener("mouseout", handleTest = (e) => {
      let ele = e.target;
      ele.style.background = "gray";
    });
  }

  bindEvents() {
    const ul = document.getElementById("grid");
    ul.addEventListener("click", (e) => {
      this.handleClick(e.target);
    });
  }

  handleClick(e) {
    let pos = e.getAttribute("data-pos");
    let parsedPos = JSON.parse(pos);
    this.game.playMove(parsedPos);
    this.makeMove(e);
  }

  makeMove(square) {
    square.style.background = "white";
  }

}


module.exports = View;
