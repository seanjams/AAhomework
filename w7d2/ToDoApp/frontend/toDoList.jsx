import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './frontend/store/store';
import allTodos from './frontend/reducers/selectors';
import Root from './frontend/components/root';
import { fetchTodos } from './frontend/actions/todo_actions';

document.addEventListener('DOMContentLoaded', () => {
  window.fetchTodos = fetchTodos;
  const store = configureStore();
  window.store = store;
  ReactDOM.render(<Root store={ store }/>,
document.getElementById('root'));
});
