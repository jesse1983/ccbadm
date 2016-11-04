const React = require('react');
// const DocumentTitle = require('react-document-title');
const App = require('./../commons/app/app.jsx');
const Card = require('./card/card.jsx');
const PropertyService = require('./../../services/property/property.service');

class Properties extends React.Component {
  constructor(props) {
    super(props);
    this.state = { properties: [] };
    if (process.browser) {
      if (window.dataApp.route === 'properties') {
        this.state = { properties: (window.dataApp.data || []) };
      }
    } else {
      this.state = { properties: props.data };
    }
  }
  componentDidMount() {
    PropertyService.getAll().then((result) => {
      this.setState({ properties: result });
    });
  }

  render() {
    return (
      <App>
        {(this.state.properties) ?
          <div className="row">
            {this.state.properties.map((property) => {
              return <Card property={property} key={property.id} />;
            })}
          </div>
        : null}
      </App>
    );
  }
}

module.exports = Properties;
