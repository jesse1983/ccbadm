const React = require('react');
const Link = require('react-router').Link;

if (process.browser) {
  /* eslint global-require: "off" */
  require('./nav-items.sass');
  /* eslint global-require: "always" */
}

class NavItems extends React.Component {
  render() {
    return (
      <ul className="nav  nav-pills nav-stacked">
        <li className="nav-item">
          <Link className="nav-link" to="/" onClick={this.props.close.bind(this)}>Imóveis</Link>
        </li>
        <li className="nav-item">
          <Link className="nav-link" to="/users" onClick={this.props.close.bind(this)}>Usuários</Link>
        </li>
        <li className="nav-item">
          <Link className="nav-link" to="/logout" onClick={this.props.close.bind(this)}>Sair</Link>
        </li>
      </ul>
    );
  }
}

module.exports = NavItems;
