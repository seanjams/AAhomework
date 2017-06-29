const readline = require('readline');

const reader = readline.createInterface({
  // it's okay if this part is magic; it just says that we want to
  // 1. output the prompt to the standard output (console)
  // 2. read input from the standard input (again, console)

  input: process.stdin,
  output: process.stdout
});

function addNumbers(sum = 0, numsLeft, cb) {
  if (numsLeft === 0) {
    cb(sum);
    reader.close();
  } else {
    reader.question("Input Number", (answer) => {
      answer = parseInt(answer);
      sum += answer;
      console.log(`Partial sum ${sum}`);
      return addNumbers(sum, --numsLeft, cb);
    });
  }


}

addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));
