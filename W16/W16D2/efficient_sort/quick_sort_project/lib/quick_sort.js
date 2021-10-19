function quickSort(array) {
    if (array.length === 0 || array.length === 1) return array;

    // let pivot = array[0];

    let pivot = array.shift();
    let left = array.filter(el => el < pivot);
    let right = array.filter(el => el >= pivot);

    let leftSorted = quickSort(left);
    let rightSorted = quickSort(right);

    return leftSorted.concat([pivot]).concat(rightSorted);
}


module.exports = {
    quickSort
};