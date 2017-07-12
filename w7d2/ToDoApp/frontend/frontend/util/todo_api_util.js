export const getTodos = () => (
  $.ajax({
    method: 'GET',
    url: '/api/todos'
  })
);

export const postTodo = () => (
  $.ajax({
    method: 'POST',
    url: '/api/todos'
  })
);
//
// export default getTodos;


// getTodos().then(
//   todos => console.log(todos),
//   error => console.log(error)
//  );
