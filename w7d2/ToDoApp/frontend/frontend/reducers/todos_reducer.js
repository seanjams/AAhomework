import {
  RECEIVE_TODO,
  RECEIVE_TODOS,
  REMOVE_TODO,
  receiveTodo,
  receiveTodos } from '../actions/todo_actions';
// import receiveTodo from '../actions/todo_actions';

const initialState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false
  },
  2: {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true
  },
};

const todosReducer = (state = initialState, action) => {
  switch(action.type) {
    case RECEIVE_TODOS:
      const newState = {};
      action.todos.forEach(todo => {newState[todo.id] = todo;});
      return newState;
    case RECEIVE_TODO:
      const mergeState = { [action.todo.id]: action.todo };
      return Object.assign({}, state, mergeState);
    case REMOVE_TODO:
      const removedState = Object.assign({}, state);
      delete removedState[action.todo.id];
      return removedState;
    default:
      return state;
  }
};

export default todosReducer;
