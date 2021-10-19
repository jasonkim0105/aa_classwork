function swap(array, idx1, idx2) {
    let temp = array[idx1];
    array[idx1] = array[idx2];
    array[idx2] = temp

    return array;
}

function bubbleSort(array) {
    let sorted = true;
    while (sorted) {
        sorted = false;
        for (let i = 0; i < array.length; i++) {
            if (array[i] > array[i+1]){
                swap(array, i, i+1);
                sorted = true;
            }
        }
    }
    return array;
}


module.exports = {
    bubbleSort,
    swap
};