import React from 'react';

class Tile extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const tile = this.props.tile;
    const bombCount = tile.adjacentBombCount();
    var text = "";

    if (tile.bombed) {
      text = "💣";
    } else if (tile.flagged) {
      text = 	"⚑";
    } else if (tile.explored) {
      text = bombCount;
    }
    return(
      <div className="tile">
        <button>{text}</button>
      </div>
    );
  }
}

export default Tile;
