const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});


function askIfGreaterThan(el1, el2, callback) {
  reader.question(`Is ${el1} greater than ${el2} (Y/N):  `, function (answer) {
    callback(answer.toLowerCase() === 'y');
  });
}

function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
  if (i < arr.length - 1) {
    askIfGreaterThan(arr[i], arr[i + 1], function b(bool) {
      if (bool) {
        let tmp = arr[i];
        arr[i] = arr[i+ 1];
        arr[i+ 1] = tmp;
        madeAnySwaps = true;
      }
      innerBubbleSortLoop(arr, i +1 , madeAnySwaps, outerBubbleSortLoop);
    });
  } else {
    outerBubbleSortLoop(madeAnySwaps);
  }
}

function absurdBubbleSort(arr, sortCompletionCallback) {
  function outerBubbleSortLoop(madeAnySwaps) {
    if (madeAnySwaps) {
      innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
    } else {
      sortCompletionCallback(arr);
      reader.close();
    }
  }
  outerBubbleSortLoop(true);
}
// innerBubbleSortLoop([2,6,2,68,55], 0, false, outerBubbleSortLoop);
absurdBubbleSort([2,3,4], (el) => console.log(`${el} is sorted!`));
