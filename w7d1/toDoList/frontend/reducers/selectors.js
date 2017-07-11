export const allTodos = ({ todos }) => {
  let keys = Object.keys(todos);
  return keys.map(key => todos[key]);
};

window.allTodos = allTodos;
