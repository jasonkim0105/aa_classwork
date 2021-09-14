class Store {
  constructor(rootReducer) {
    this.rootReducer = rootReducer;
    this.state = {
      user: "Andy",
      role: "Instructor"
    };
  }

  getState() {
    return Object.assign({}, this.state);
  }
}

combineReducers(reducers) {
    
}

module.exports = Store;