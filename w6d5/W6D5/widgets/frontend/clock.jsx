import React from 'react';

class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = { time: new Date() };
  }

  render() {
    return(
      <h1>Clock</h1>
    );
  }

  tick() {
    const time = new Date();
    this.setState({ time });
  }
}

export default Clock;
