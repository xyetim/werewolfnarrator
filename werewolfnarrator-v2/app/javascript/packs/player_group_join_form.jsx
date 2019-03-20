import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

class PlayerGroupJoinForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {public_id: ""}

    this.handleChange = this.handleChange.bind(this); // allow use of this in handleChange
  }

  handleChange(event) {
    this.setState({public_id: event.target.value.toUpperCase()});
  }

  handleJoin(event) {
    event.preventDefault();
    const data = new FormData(event.target);
    console.log(data)
    fetch('/player_group', {
      method: 'POST',
      body: data,
    });
  }

  render() {
    return (
      <form>
        <input
          type="text"
          name="public_id"
          value={this.state.public_id}
          onChange={this.handleChange}
          placeholder="Group code"
          maxLength='9'/>
        <input type="submit" onClick={this.handleJoin}></input>
      </form>
    )
  }
}

document.addEventListener('DOMContentLoaded', () => {
  let rootNode = document.body.appendChild(document.createElement('div'));
  ReactDOM.render(
    <PlayerGroupJoinForm />,
    rootNode
  )
})
