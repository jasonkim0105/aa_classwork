Array.prototype.mergeSort = function (cb) {
  if (this.length <= 1) return this;
  if (!cb) {
    cb = (left, right) => {
      if (left > right){
        return -1;
      } else if (left === right) {
        return 0;
      } else {
        return 1;
      }
    }
  }

  let mid = Math.floor(this.length / 2);
  let left = this.slice(0, mid);
  let right = this.slice(mid);

  left = left.mergeSort();
  right = right.mergeSort();
  return merge(left, right, cb);
}

function merge(left, right, cb) {
  let merged = [];
  while (left.length !== 0 && right.length !== 0) {
    if (cb(left[0], right[0]) <= 0) {
      merged.push(left.shift());
    } else {
      merged.push(right.shift());
    }
  };
  return merged.concat(left).concat(right);
}

function mergeSort(arr) {
  if (arr.length <= 1) return arr;

  let mid = Math.floor(arr.length / 2);
  let left = arr.slice(0, mid);
  let right = arr.slice(mid);

  left = left.mergeSort();
  right = right.mergeSort();
  return merge(left, right)
}

function merge(left, right) {
  let merged = [];
  while (left.length && right.length) {
    if (left[0] < right[0]) merged.push(left.shift());
    else merged.push(right.shift());
  };
  return merged.concat(left, right)
}

// let bah = [1,4,6,2,7];
// console.log(Array.mergeSort([1,4,6,2,7]));
// console.log(bah.mergeSort());

Array.prototype.bsearch = function(target) {
  if (this.length === 0) return -1;

  let mid = Math.floor(this.length/2);

  if (this[mid] === target) {
    return mid;
  } else if (this[mid] > target) {

    return this.bsearch(this.slice(0, mid), target);
  } else {
    let searched = this.bsearch(this.slice(mid + 1), target);
    return (searched === -1) ? -1 : searched + mid + 1;
  }
}
let bah = [1, 4, 6, 2, 7, 5];
console.log(bah.bsearch(7));


function bsearch(arr, target){
  if (arr.length === 0) return -1;

  let mid = Math.floor(arr.length/2);

  if (arr[mid] === target){
    return mid;
  } else if(arr[mid] > target) {
    return bsearch(arr.slice(0, mid), target);
  } else {
    const searched = bsearch(arr.slice(mid + 1), target);
    return searched === -1 ? -1 : searched + mid + 1;
  }
}
// arrz = [1,4,6,2,7];
// console.log(bsearch(arrz, 2));