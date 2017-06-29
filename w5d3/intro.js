function uniq (arr) {
  const uniqs = [];
  arr.forEach ((el) => {
    if (!uniqs.includes(el)) {
      uniqs.push(el);
    }
  });
  return uniqs;
}

function twoSum(arr) {
  const sums = [];

  for (var i = 0; i < arr.length; i++) {

    for (var j = i+1; j < arr.length; j++) {
      if ((arr[i] + arr[j]) === 0) {
        sums.push([i,j]);
      }
    }
  }

  return sums;
}

function myTranspose(arr) {
  const transpose = [];

  for (var i = 0; i < arr[0].length; i++) {
    let column = [];
    for (var j = 0; j < arr.length; j++) {
      column.push(arr[j][i]);
    }
    transpose.push(column);
  }
  return transpose;
}

Array.prototype.myEach = function(cb){
  for (var i = 0; i < this.length; i++) {
    cb(this[i]);
  }
  return this;
};

Array.prototype.myMap = function(cb){
  const result = [];
  this.myEach((el) => {
    result.push(cb(el));
  });
  return result;
};

Array.prototype.myInject = function(accum, cb){
  if(!cb){
    cb = accum;
    accum = this[0];
  }

  this.myEach((el) => {
    if (this.indexOf(el) !== 0){
      accum = cb(accum, el);
    }
  });
  return accum;
};

function bubbleSort(arr, cb = (x,y) => x < y ) {
  let sorted = false;
  while (!sorted) {
    sorted = true;
    for (let i = 0; i < arr.length-1; i++) {
      let j = i+1;
      if (!cb(arr[i], arr[j])) {
        let el = arr[j];
        arr[j] = arr[i];
        arr[i] = el;
        sorted = false;
      }
    }
  }
  return arr;
}

String.prototype.substrings = function(){
  const substrings = [];
  for (var i = 0; i < this.length; i++) {
    for (var j=i+1; j <= this.length; j++) {
      let el = this.slice(i,j);
      if (!substrings.includes(el)){
        substrings.push(el);
      }
    }
  }
  return substrings;
};

function range(start, end) {
  if (end < start) { return []; }
  let arr = [start];
  return arr.concat(range(start+1, end));
}

function exponent(base, exp){
  if (exp===0){
    return 1;
  }
  if (exp===1){
    return base;
  }
  if (exp%2===0){
    return exponent(base, (exp/2)) * exponent(base, (exp/2));
  } else {
    return exponent(base, ((exp-1)/2)) * exponent(base, ((exp-1)/2)) * base ;
  }
}

function subsets(arr) {
  let result = [[]];
  if (arr.length === 0) {return result;}
  // if (arr.length === 1) {return [arr]}

  let oldSets = subsets(arr.slice(1));
  let first = [arr[0]];
  let newSets = oldSets.map((subset) => {
    // console.log(subset);
    return first.concat(subset);
  });
  // console.log("old: " + oldSets);
  // console.log("new: " + newSets);
  // console.log(last);
  // console.log(oldSets.concat(newSets));
  return oldSets.concat(newSets);
}
