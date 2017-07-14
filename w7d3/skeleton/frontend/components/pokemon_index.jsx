import React from 'react';

class PokemonIndex extends React.Component {
  
  componentDidMount() {
    this.props.requestAllPokemon();
  }

  renderPokemon(pokemon) {
    return pokemon.map((poke) => {
      return (
        <li>
          <img src={ poke.image_url }
            alt={ poke.name }
            width="10%"
            height="10%"/>
          { poke.name }
        </li>
      )
    })
  }

  render () {
    const pokemon = this.props.pokemon;
    return (
      <ul>
        { this.renderPokemon(pokemon) }
      </ul>
    )
  }

}

export default PokemonIndex;
