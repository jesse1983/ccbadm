const React = require('react');
const DocumentTitle = require('react-document-title');
const App = require('./../commons/app/app.jsx');


class Home extends React.Component {
  render() {
    return (
      <App>
        <DocumentTitle title="Dashboard">
          <h1>Dashboard</h1>
        </DocumentTitle>
      </App>
    );
  }
}

module.exports = Home;