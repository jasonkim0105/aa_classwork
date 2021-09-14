const Store = require("./store");

const action = {
  type: "change role",
  newRole: "Student"
};

const roleReducer = (oldRole = null, action) => {
  if (action.type === "change role") {
    return action.newRole;
  } else {
    return oldRole;
  }
};



const store2 = new Store();

console.log(roleReducer(store2.role, action));