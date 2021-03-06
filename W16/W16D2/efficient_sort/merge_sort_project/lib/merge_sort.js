function merge(array1, array2) {
    let sorted = [];

    while (array1.length && array2.length) {
        if(array1[0] <= array2[0]){
            sorted.push(array1.shift())
        } else {
            sorted.push(array2.shift())
        }
    }
    return sorted.concat(array1, array2);
}

function mergeSort(array) {
    if (array.length <= 1) return array;

    let mid = Math.floor(array.length/2);

    let left = array.slice(0, mid);
    let right = array.slice(mid);

    let sortedLeft = mergeSort(left);
    let sortedRight = mergeSort(right);

    return merge(sortedLeft, sortedRight);
}

module.exports = {
    merge,
    mergeSort
};