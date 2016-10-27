const React = require('react');
const appActions = require('./app.reflux').appActions;

class BarIcons extends React.Component {
  openMenu(ev) {
    ev.preventDefault();
    appActions.update('menu', true);
  }
  render() {
    return (
      <div>
        <ul className="nav navbar-nav float-xs-left">
          <li>
            <a href="" onClick={this.openMenu.bind(this)}>
              <i className="fa fa-bars" />
            </a>
          </li>
          <li className="hidden-xs-up"><a><i className="fa fa-chevron-left" /></a></li>
        </ul>
        <ul className="nav navbar-nav float-xs-right">
          <li><a><i className="fa fa-search" /></a></li>
        </ul>
      </div>
    );
  }
}

module.exports = BarIcons;
