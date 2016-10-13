const React = require('react');
const appActions = require('./../app.reflux').appActions;
const NavItems = require('./nav-items/nav-items.jsx');

if (process.browser) {
  require('./nav.sass');
}

class Nav extends React.Component {
  close() {
    appActions.update('menu', false);
  }
  render() {
    return (
      <header className="vertical hidden-print">
        <div className="container-fluid">
          <div className="row">
            <nav className="nav nav-stacked navbar-inverse col-xs-12 col-sm-4 col-md-3">
              <div className="navbar-login">
                <span>Jessé Pinheiro </span>
                <button type="button" className="close" onClick={this.close.bind(this)}>
                  <span>×</span>
                </button>
              </div>
              <NavItems close={this.close} />
            </nav>
            <div className="hidden-xs-down col-sm-8 col-md-9" onClick={this.close.bind(this)} />
          </div>
        </div>
      </header>
    );
  }
}

module.exports = Nav;
