import React from 'react';

class Autocomplete extends React.Component {
  constructor(props) {
    super(props);
    this.state = { inputVal: "" };
  }

  handleInput(event){
    this.setState( { inputVal: event.currentTarget.value } );
  }

  render() {
    const matchingNames = this.props.names.filter((name) => {
      return name.substr(0,this.state.inputVal.length) === this.state.inputVal;
    });
    return(
      <div>
        <input type="text" onChange={this.handleInput.bind(this)} value={this.state.inputVal} placeholder="Search..."/>
        <ul>
          { matchingNames.map((name, i) => <li key={i}>{name}</li>) }
        </ul>
      </div>
    );
  }
}

module.exports = Autocomplete;
