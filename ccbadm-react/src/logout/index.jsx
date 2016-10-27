const React = require('react');
const auth = require('./../auth');
const browserHistory = require('react-router').browserHistory;


if (process.browser) {
  /* eslint global-require: "off" */
  require('./index.sass');
}

class Login extends React.Component {
  componentDidMount() {
    /* global document */
    document.title = 'Logout';
  }
  desauthenticate(ev) {
    ev.preventDefault();
    auth.logout();
  }
  goBack() {
    browserHistory.goBack();
  }
  render() {
    return (
      <div className="container-fluid container-bar">
        <div className="col-sm-8 offset-sm-2 col-md-6 offset-md-3 col-lg-4 offset-lg-4">
          <div className="login-form">
            <h1 className="text-center">Logout</h1>
            <p className="text-center">Deseja realmente sair?</p>
            <hr />
            <div className="row">
              <div className="col-xs-6">
                <button
                  type="button"
                  className="btn btn-outline-primary btn-lg btn-block"
                  onClick={this.goBack.bind()}
                >
                  Voltar
                </button>
              </div>
              <div className="col-xs-6">
                <button
                  type="button"
                  className="btn btn-primary btn-lg btn-block"
                  onClick={this.desauthenticate.bind()}
                >
                  Sim
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

module.exports = Login;
