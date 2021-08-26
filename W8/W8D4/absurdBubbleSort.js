const readline = require("readline");
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function askIfGreaterThan(el1, el2, callback) {
  reader.question("Is " + el1 + " greater than " + el2 + "?" , (answer) => {
    if (answer === "yes") {
      callback(true);
    } else {
      callback(false);
    }
  });
}

function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
  if (i < arr.length - 1) {
    askIfGreaterThan(arr[i], arr[i+1], function (isGreaterThan) {
      if (isGreaterThan) {
        elone = arr[i];
        arr[i] = arr[i+1];
        arr[i+1] = elone;
        madeAnySwaps = true;
      }
      innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outerBubbleSortLoop);
    });
  }

  if (i == (arr.length - 1)) {
    outerBubbleSortLoop(madeAnySwaps);
    return;
  }
}

function absurdBubbleSort(arr, sortCompletionCallback) {
  function outerBubbleSortLoop(madeAnySwaps){
    if (madeAnySwaps == true) {
      innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
    } else {
      sortCompletionCallback(arr)
    }
  }
  // Kick the first outer loop off, starting `madeAnySwaps` as true.
  outerBubbleSortLoop(true);
}

absurdBubbleSort([3, 2, 1], function(arr) {
  console.log("Sorted array: " + JSON.stringify(arr));
  reader.close();
});

// console.log(innerBubbleSortLoop([1,4,2,5], 3, ))
// askIfGreaterThan(5,3, (el) => {el + 4})