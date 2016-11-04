const React = require('react');
const App = require('./../commons/app/app.jsx');

class Users extends React.Component {
  componentDidMount() {
    document.title = 'Users';
  }
  render() {
    return (
      <App>
        <h1>And this is my users</h1>
      </App>
    );
  }
}

module.exports = Users;
