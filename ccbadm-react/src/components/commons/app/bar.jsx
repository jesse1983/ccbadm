const React = require('react');
const BarForm = require('./bar-form');
const BarIcons = require('./bar-icons.jsx');

class Bar extends React.Component {
  render() {
    return (
      <header className="horizontal hidden-print">
        <nav role="navigation" className="navbar navbar-inverse navbar-fixed-top">
          <BarIcons opened={this.props.opened} />
          {(BarForm === 2) ? <BarForm  opened={this.props.opened} /> : null }
        </nav>
      </header>
    );
  }
}

module.exports = Bar;
