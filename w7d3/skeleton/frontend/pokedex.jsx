import React from 'react';
import ReactDOM from 'react-dom';
import * as Util from './util/api_util';
import { receiveAllPokemon, requestAllPokemon } from './actions/pokemon_actions.js';
import configureStore from './store/store.js';
import selectAllPokemon from './reducers/selectors.js'

import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  window.fetchAllPokemon = Util.fetchAllPokemon;
  window.receiveAllPokemon = receiveAllPokemon;
  window.requestAllPokemon = requestAllPokemon;
  window.selectAllPokemon = selectAllPokemon;

  const store = configureStore();
  window.getState = store.getState;
  window.dispatch = store.dispatch;


  const root = document.getElementById('root');
  ReactDOM.render(<Root store={ store } />, root);
});
