const React = require('react');
const ReactDOM = require('react-dom');
const Router = require('react-router').Router;
const Route = require('react-router').Route;
// const Link = require('react-router').Link;
const browserHistory = require('react-router').browserHistory;

const Home = require('./src/home/index');
const Users = require('./src/users/index');

class App extends React.Component {
  render() {
    return (
      <Router history={browserHistory}>
        <Route path="/" component={Home} />
        <Route path="/users" component={Users} />
      </Router>
    );
  }
}

/* global document */
ReactDOM.render(React.createElement(App), document.getElementById('app'));
