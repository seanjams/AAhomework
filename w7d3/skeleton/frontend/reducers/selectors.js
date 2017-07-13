import { values } from 'lodash';

const selectAllPokemon = (state) => {
  return values(state.pokemon);
}

export default selectAllPokemon;
