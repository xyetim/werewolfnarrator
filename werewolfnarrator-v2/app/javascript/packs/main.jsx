// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

class PlayerGroup extends React.Component {
  constructor(props) {
    super(props);
    //this.state = {date: new Date()};
  }

  render() {
    return (
      <div>
        <h2>Group: 1</h2>
        <button>Join</button>
        <button>Delete</button>
      </div>
    );
  }
}

document.addEventListener('DOMContentLoaded', () => {
  let rootNode = document.body.appendChild(document.createElement('div'));
  ReactDOM.render(
    <PlayerGroup name="React" />,
    rootNode
  )
})
