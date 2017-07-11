import React from 'react';
import ReactDOM from 'react-dom';

import Clock from './clock';
import Weather from './weather';
import Autocomplete from './autocomplete';

const names = [
  "keith",
  "sean",
  "molly",
  "heather",
  "sarah",
  "mike",
  "blake",
  "rick",
  "morty"
];

class Root extends React.Component {
  render() {
    return(
      <div>
        <h2>Widgets</h2>
        <Clock />
        <Weather />
        <Autocomplete names={names} />
      </div>
    );
  }
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(<Root />, document.getElementById('root'));
});
