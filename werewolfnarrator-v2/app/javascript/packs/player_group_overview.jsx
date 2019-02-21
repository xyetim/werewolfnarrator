import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

class PlayerGroupOverview extends React.Component {
  constructor(props) {
    super(props);
    this.state = {}
  }

  componentDidMount() {
    fetch("/player_group")
      //.then(res => res.json())
      .then(
        (result) => {
          debugger
          this.setState({
            isLoaded: true,
            PlayerGroups: result.items
          });
        },
        (error) => {
          this.setState({
            isLoaded: true,
            error
          });
        }
      )
  }

  render() {
    return (
      <p>
        Hi
      </p>
    )
  }
}

class PlayerGroup extends React.Component {
  constructor(props) {
    super(props);
    this.state = {name: ''};

    this.handleChange = this.handleChange.bind(this);
  }

  handleChange(event) {
    this.setState({
      [event.target.name]: event.target.value
    });
  }

  render() {
    return (
      <div>
        <h2>Group: 1</h2>
        <form>
          <input type="text" name="name" value={this.state.name} onChange={this.handleChange} />
          <input type="submit" onClick={this.handleJoin}></input>
        </form>
        {/*<button onClick={this.handleJoin}>Join</button>*/}
        {/*<button onClick={handleDelete}>Delete</button>*/}
      </div>
    );
  }
}

document.addEventListener('DOMContentLoaded', () => {
  let rootNode = document.body.appendChild(document.createElement('div'));
  ReactDOM.render(
    <PlayerGroupOverview />,
    rootNode
  )
})
