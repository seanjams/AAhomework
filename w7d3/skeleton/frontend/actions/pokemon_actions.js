import * as Util from '../util/api_util.js';

export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON";
export const RECEIVE_POKEMON = "RECEIVE_POKEMON";

export const receiveAllPokemon = pokemon => ({
  type: RECEIVE_ALL_POKEMON,
  pokemon
});

export const requestAllPokemon = () => dispatch => (
  Util.fetchAllPokemon()
    .then(pokemon => dispatch(receiveAllPokemon(pokemon)));
);
