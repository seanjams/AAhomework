// // sum with arguments keyword
//
// function sum() {
//
//   let arr = Array.from(arguments);
//
//   let result = 0;
//
//   for (var i = 0; i < arr.length; i++) {
//     result += arr[i];
//   }
//   return result;
// }
//
// console.log(sum(1,2,3,4));
//
// // sum with rest operator
//
function sum(...args) {

  let result = 0;

  for (var i = 0; i < args.length; i++) {
    result += args[i];
  }
  return result;
}

// console.log(sum(1,2,3,4));
//
// Function.prototype.myBind = function() {
//   let bindArgs = Array.from(arguments);
//   let that = this;
//   return function() {
//     let callArgs = Array.from(arguments);
//     // console.log(bindArgs);
//     console.log(callArgs);
//     let totalArgs = bindArgs.concat(callArgs).slice(1);
//     return that.apply(bindArgs[0], totalArgs);
//   };
// };
//
// Function.prototype.myBind2 = function(...bindArgs) {
//   return (...callArgs) => {
//     console.log(callArgs);
//     let totalArgs = bindArgs.concat(callArgs);
//     return this.call(...totalArgs);
//   };
// };
//
// class Cat {
//   constructor(name) {
//     this.name = name;
//   }
//
//   says(sound, person) {
//     console.log(`${this.name} says ${sound} to ${person}!`);
//     return true;
//   }
// }
//
// const markov = new Cat("Markov");
// const breakfast = new Cat("Breakfast");
//
// markov.says("meow", "Ned");
//
// markov.says.myBind2(breakfast, "meow", "Kush")();
// // Breakfast says meow to Kush!
// // true
//
// // no bind time args (other than context), call time args are "meow" and "me"
// markov.says.myBind2(breakfast)("meow", "a tree");
// // Breakfast says meow to a tree!
// // true
//
// // bind time arg is "meow", call time arg is "Markov"
// markov.says.myBind2(breakfast, "meow")("Markov");


// CurriedSum

function curriedSum(numArgs) {

  let numbers = [];
  let _curriedSum = (num) => {
    numbers.push(num);
    if (numbers.length === numArgs) {
      return sum(...numbers);
    }
    else {
      return _curriedSum;
    }
  };

  return _curriedSum;

}

Function.prototype.curry1 = function(numArgs) {

  let numbers = [];
  let _curry = (num) => {
    numbers.push(num);
    if (numbers.length === numArgs) {
      return this.apply(undefined, numbers);
    }
    else {
      return _curry;
    }
  };

  return _curry;

};

Function.prototype.curry2 = function(numArgs) {

  let numbers = [];
  let _curry = (num) => {
    numbers.push(num);
    if (numbers.length === numArgs) {
      return this(...numbers);
    }
    else {
      return _curry;
    }
  };

  return _curry;

};

const result = sum.curry1(5);
console.log(result(5)(30)(10)(1)(-1));
