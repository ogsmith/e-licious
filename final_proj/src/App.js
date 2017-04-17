import React, { Component } from 'react';
import './App.css';
var data = require('./pythonGenerated.json');



export default class App extends Component {

  quoteEliminator(string) {
    string = string.toString();
    string = string.substring(1,string.length-1);
    return string;
  }

  render() {
    return (
      <div className="App">
        <div className="App-header">
          {this.quoteEliminator(JSON.stringify(data.menu_category[0]))}
        </div>
        <div className="App-header">
          {this.quoteEliminator(JSON.stringify(data.menu_item[0]))}
        </div>

      </div>
    );
  }
}
