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

 
  }

  bindEvents() {
    const ul = document.getElementById("grid");

       //Hover listeners
      let mouseOn = function(e){
        let ele = e.target;
        ele.style.background = "yellow";
      }

      let mouseOff = function (e){
        let ele = e.target;
        ele.style.background = "gray";
      }

    ul.addEventListener("mouseover", mouseOn);

    ul.addEventListener("mouseout", mouseOff);

    ul.addEventListener("click", (e) => {
      this.handleClick(e.target);
      // ul.removeEventListener("mouseout", mouseOff);
      // ul.removeEventListener("mouseover", mouseOn);
    });
  }

  handleClick(e) {
    let pos = e.getAttribute("data-pos");
    let parsedPos = JSON.parse(pos);
    this.game.playMove(parsedPos);
    this.makeMove(e);

    if (this.game.isOver()){
      let message = document.createElement("h1");
      message.append(`You Won ${this.game.currentPlayer}`);
      this.el.append(message);
    }
  }

  makeMove(square) {
    square.style.background = "white";
    square.append(this.game.currentPlayer);
    square.style.textAlign = "center";
    square.style.fontSize = "40px"
  }

}


module.exports = View;
