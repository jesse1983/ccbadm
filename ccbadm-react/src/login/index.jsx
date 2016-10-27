const React = require('react');
const auth = require('./../auth');

if (process.browser) {
  /* eslint global-require: "off" */
  require('./index.sass');
}

class Login extends React.Component {
  constructor() {
    super();
    this.state = {
      email: '',
      password: '',
      error: false,
    };
  }
  componentDidMount() {
    /* global document */
    document.title = 'Login';
  }
  handle(ev) {
    const obj = {};
    obj[ev.target.id] = ev.target.value;
    this.setState(obj);
  }
  close() {
    this.setState({ error: false });
  }
  authenticate(ev) {
    ev.preventDefault();
    auth.login(this.state.email, this.state.password).catch((err) => {
      this.setState({ error: err });
    });
  }
  render() {
    return (
      <div className="container-fluid container-bar">
        <form
          name="form"
          method="POST"
          action="/"
          onSubmit={this.authenticate.bind(this)}
          className="col-sm-8 offset-sm-2 col-md-6 offset-md-3 col-lg-4 offset-lg-4"
        >
          <div className="login-form">
            <h1 className="text-center">Account</h1>
            <p className="text-center">Por favor, entre com seu e-mail e senha</p>
            <div className="form-group">
              <input
                id="email"
                required=""
                type="text"
                value={this.state.email}
                placeholder="Entre com seu e-mail"
                onChange={this.handle.bind(this)}
                className="form-control login-field"
              />
              <label htmlFor="email" className="login-field-icon fa fa-user" />
            </div>
            <div className="form-group">
              <input
                id="password"
                required=""
                type="password"
                value={this.state.password}
                placeholder="Entre com sua senha"
                name="uPassword"
                onChange={this.handle.bind(this)}
                className="form-control login-field"
              />
              <label htmlFor="password" className="login-field-icon fa fa-lock" />
            </div>
            {(this.state.error) ?
              <div role="alert" className="alert alert-danger alert-dismissible">
                {JSON.stringify(this.state.error)}
                <small className="ng-binding">
                  <button type="button" className="close" onClick={this.close.bind(this)}>
                    <span aria-hidden="true">×</span>
                  </button>
                </small>
              </div>
            : null}
            <button type="submit" className="btn btn-primary btn-lg btn-block">
              Entrar
            </button>
          </div>
        </form>
      </div>
    );
  }
}

Login.propTypes = {
  email: React.PropTypes.string.isRequired,
  password: React.PropTypes.string.isRequired,
};

module.exports = Login;
