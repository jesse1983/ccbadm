const React = require('react');
const ReactDOM = require('react-dom');
const Router = require('react-router').Router;
const Route = require('react-router').Route;
const browserHistory = require('react-router').browserHistory;
const Auth = require('./src/auth');
const routes = require('./routes');

class App extends React.Component {
  security(route, component) {
    if (route.public) {
      return (
        <Route
          key={route.path}
          path={route.path}
          component={component}
        />
      );
    }
    return (
      <Route
        key={route.path}
        path={route.path}
        component={component}
        onEnter={Auth.requireAuth}
      />
    );
  }
  render() {
    return (
      <Router history={browserHistory}>
        {Object.keys(routes).map((key) => {
          /* eslint import/no-dynamic-require: 0 */
          /* eslint global-require: 0 */
          const component = require(`./src/components/${key}/index`);
          return this.security(routes[key], component);
        })}
      </Router>
    );
  }
}


/* global document */
ReactDOM.render(React.createElement(App), document.getElementById('app'));
