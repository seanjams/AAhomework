import React from 'react';

class Weather extends React.Component {
  constructor(props) {
    super(props);

    this.state = { city: "", temp: 0 };
  }

  componentDidMount() {
    this.location = navigator.geolocation;
    let req = new XMLHttpRequest();
    req.open('GET', 'http://api.openweathermap.org/data/2.5/weather?id=5391959&APPID=14432b6ecb2831e713535552dc34b1dc', true);
    req.onload = () => {
      if (req.status >= 200 && req.status < 400) {
        let resp = JSON.parse(req.responseText);
        console.log(typeof resp);
        let city = resp.name;
        let temp = (resp.main.temp).toF();
        this.setState({city, temp});
      } else {
        console.log('servar did not give us info');
      }
    };

    req.onerror = function() {
      console.log('could not reach servar');
    };

    req.send();

    Number.prototype.toF = function() {
      let kel = this;
      let cel = kel - 273.15;
      return (cel * 9) / 5 + 32;
    };
  }

  render() {
    return (
      <div className="weather">
        <h2>Weather</h2>
        <div><h2>{ this.state.city }</h2></div>
        <div><h2>{ this.state.temp }</h2></div>
      </div>
    );
  }
}

export default Weather;

//api key: 14432b6ecb2831e713535552dc34b1dc
//http://api.openweathermap.org/data/2.5/forecast?id=524901&APPID=14432b6ecb2831e713535552dc34b1dc
// http://api.openweathermap.org/data/2.5/weather?id=5391959&APPID=14432b6ecb2831e713535552dc34b1dc
