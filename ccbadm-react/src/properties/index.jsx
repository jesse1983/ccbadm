const React = require('react');
// const DocumentTitle = require('react-document-title');
const App = require('./../commons/app/app.jsx');

class Properties extends React.Component {
  componentWillMount() {
    console.log(this.props);
  }
  render() {
    return (
      <App>
        <h1>Properties</h1>
        <div className="row">
          {[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11].map((key) => {
            return (
              <div className="col-sm-6 col-md-4 col-lg-3" key={key}>
                <div className="card">
                  <img className="card-img-top img-fluid" src="http://res.cloudinary.com/hmj5guwuy/image/upload/w_400,h_200,c_fill/v1429922554/vyldrlptx6elhtcjmaz4.jpg" alt="Comum" />
                  <div className="card-block">
                    <h4 className="card-title">Igreja</h4>
                    <p className="card-text">Nome</p>
                  </div>
                  <div className="card-block">
                    <a href="/users" className="card-link">Card link</a>
                    <a href="/users" className="card-link">Another link</a>
                  </div>

                </div>
              </div>
            );
          })}
        </div>
      </App>
    );
  }
}

module.exports = Properties;
