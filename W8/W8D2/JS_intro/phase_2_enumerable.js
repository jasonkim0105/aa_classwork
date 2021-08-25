Array.prototype.myEach = function(eachCB) {
  for (i = 0; i < this.length; i++){
    eachCB(this[i]);
  }
};

// arr.forEach(el => {
//     console.log(el);
//   })

// [1, 2, 3].myEach(console.log)

Array.prototype.myMap = function(mapCB) {
  let newArr = [];
  this.myEach((el) => {
    newArr.push(mapCB(el));
  })
  return newArr;
};
  // return function myEach(eachCB) {
  //   newArr.push(myEach(cb));
  //   return newArr;
  // }



console.log([1, 2, 3].myMap())

