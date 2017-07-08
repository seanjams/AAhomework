import React from 'react';

class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = { time: new Date() };
  }

  render() {
    return(
      <div className='clock'>
        <div><h1>Clock</h1></div>
        <div className="flexContainer">
          <div id='time'>
            <h2>Time: { this.state.time.toLocaleTimeString() }</h2>
          </div>
          <div id='date'>
            <h2>Date: { this.state.time.toDateString() }</h2>
          </div>
        </div>
      </div>
    );
  }

  componentDidMount() {
    this.intervalId = setInterval(this.tick.bind(this), 1000);
  }

  componentWillUnmount() {
    clearInterval(this.intervalId);
  }

  tick() {
    const time = new Date();
    this.setState({ time });
  }
}

export default Clock;
