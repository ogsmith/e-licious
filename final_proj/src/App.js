import React, { Component } from 'react';
import './App.css';
const data = require('./pythonGenerated.json');
var file = ('./pythonGenerated.json');
var jsonfile = require('jsonfile')

export default class App extends Component {

  constructor(props) {
    super(props);
    this.state = {
      item_name: this.parseMenuItems(),
      item_desc:[],
      item_price:[]
    };
  this.createItem = this.createItem.bind(this, true);
  this.parseMenuItems = this.parseMenuItems.bind(this, true);

  }

  quoteEliminator(string) {
    var parsed = JSON.parse(string);
    parsed = string.toString();
    parsed = string.substring(1,string.length-1);
    return parsed;
  }

  signIn(){
  }
parseMenuItems(){
  var string = JSON.stringify(data);
  var arr = Object.values(data[0].name);
  var new_arr = []
  for (var i = 2; i<arr.length; i++)
    new_arr.push(arr[i])
  this.setState({
    item_name : new_arr
  });
   return new_arr;
}
createItem(event) {
     const item = this.name.value;
     let newarray = this.state.item_name;
    newarray.push(item);
    console.log("FGHJKHGFHJKGFJKL")
    this.setState({
      item_name : newarray
    });
    var obj = this.state;
    jsonfile.writeFile(file, obj, function (err) {
      console.error(err)
    })
    console.log("GHJKLKJHGVC");

  }

  render() {
    return (
      <div className="App">
        <div className="Restaurant-name">
          {this.quoteEliminator(JSON.stringify(data[0].restaurant[1]))}
        </div>
        <div className="Menu-type">
        {this.quoteEliminator(JSON.stringify(data[0].menu_category[0]))}
        </div>
        <div className="Menu-items">
         {this.state.item_name.map(function(listValue){
          return <li>{listValue}</li>;
        })}
        </div>

        <form ref=
        {(input) => this.menuForm = input}
        className="item-edit"
        onSubmit={(e) => this.createItem(e)}>
            <input ref={(input) => this.name = input} type="text" placeholder="Item name" />
            <button type="submit">Add Item</button>
        </form>

        <button onClick={this.signIn}>
          Sign In!
        </button>

      </div>
    );
  }
}
