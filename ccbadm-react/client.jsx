const React = require('react');
const ReactDOM = require('react-dom');
const Router = require('react-router').Router;
const Route = require('react-router').Route;
const browserHistory = require('react-router').browserHistory;
const Auth = require('./src/auth');

const Login = require('./src/login/index');
const Home = require('./src/home/index');
const Properties = require('./src/properties/index');
const Users = require('./src/users/index');
const Logout = require('./src/logout/index');


class App extends React.Component {
  render() {
    return (
      <Router history={browserHistory}>
        <Route path="/login" component={Login} />
        <Route path="/" component={Home} onEnter={Auth.requireAuth} />
        <Route path="/properties" component={Properties} onEnter={Auth.requireAuth} />
        <Route path="/users" component={Users} onEnter={Auth.requireAuth} />
        <Route path="/logout" component={Logout} onEnter={Auth.requireAuth} />
      </Router>
    );
  }
}


/* global document */
ReactDOM.render(React.createElement(App), document.getElementById('app'));
