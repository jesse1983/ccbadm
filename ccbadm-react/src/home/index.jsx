const React = require('react');
const App = require('./../commons/app/app.jsx');

class Home extends React.Component {
  componentDidMount() {
    // document.title = 'Dashboard';
  }
  render() {
    return (
      <App>
        <h1>My First Component</h1>
      </App>
    );
  }
}

module.exports = Home;
