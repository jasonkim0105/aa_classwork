// ([1,2,2,3,3,3].uniq() => [1,2,3])

Array.prototype.uniq = function(){
    var new_array = [];
    for(i=0; i < this.length; i++){
        if (new_array.indexOf(this[i]) === -1){
            new_array.push(this[i]);
        }
    }
    return new_array;
}


// console.log([1, 3, 2, 1, 2, 3].uniq()) 


// Array#twoSum - returns an array of position pairs where the elements sum to zero

Array.prototype.twoSum = function(){
    let new_array = [];
    for(i = 0; i < this.length; i++){
        for(j = i + 1; j < this.length; j++){
            if (this[i] + this[j] === 0){
                new_array.push([i, j])
            }
        }  
    }
    return new_array
}

// console.log([1, -1, 2, 3, -2, 4].twoSum())

// arr1 = [[1, 2, 3],[4, 5, 6]]

// result = [[1, 4], [2, 5], [3, 6]]

// def zip(*arrays)
//     length = arrays.first.length

//     (0...length).map do |i|
//         arrays.map { |array| array[i] }
//     end
// end


//     array_1 = ['a', 'b', 'c'] 
//     array_2 = [1, 2, 3] 
//     array_3 = ['w', 'x', 'y'] 

    
//      #p zip(array_1) 
//      #p zip(array_1, array_2)  # [["a", 1],["b", 2],["c", 3]]
//      p zip(array_1, array_2, array_3) 

Array.prototype.transpose = function (){
    let new_array = [];
  
    for(i = 0; i < this.length; i++){
        console.log("new loop")
        let inner_array = [];
        for(j = 0; j < this[i].length; j++){
            inner_array.push(this[j][i])
            console.log(new_array, "I am new array")
        }
        new_array.push(inner_array)
    }
    return new_array
}

// Array.prototype.transpose = function (){
//  let inner_array = [];
//  let outer_array = [];
//  while (inner_array.length < this[0].length){
//      for(j = 0; j < this[0].length; j++){
//          for(i = 0; i < this.length; i++){
//              inner_array.push(this[i][j])
//              console.log(inner_array)
//          }
//          outer_array.push(inner_array)
//      }
//     }
//     return outer_array
//  }

console.log([[1, 2, 3],[4, 5, 6], [7, 8, 9]].transpose())



