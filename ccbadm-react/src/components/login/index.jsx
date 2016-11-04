const React = require('react');
const auth = require('./../../auth');
const loginSchema = require('./../../services/login.schema');

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
      errors: {},
    };
  }
  handle(ev) {
    const obj = {};
    obj[ev.target.id] = ev.target.value;
    this.setState(obj);
    this.setState({ errors: {} });
  }

  close() {
    this.setState({ errors: {} });
  }

  authenticate(ev) {
    ev.preventDefault();
    const login = {
      email: this.state.email,
      password: this.state.password,
    };

    if (loginSchema(login)) {
      auth.login(this.state.email, this.state.password).catch((err) => {
        this.setState({ errors: { message: err } });
      });
    } else {
      this.setState({ errors: loginSchema.errors(login) });
    }
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
            <div className={(this.state.errors.email) ? 'form-group has-danger' : 'form-group'}>
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
              <div className="form-control-feedback">
                {(this.state.errors.email) ? 'Preenha um e-mail válido' : ''}
              </div>
            </div>
            <div className={(this.state.errors.password) ? 'form-group has-danger' : 'form-group'}>
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
              <div className="form-control-feedback">
                {(this.state.errors.password) ? 'Preenha sua senha' : ''}
              </div>

            </div>
            {(this.state.errors.message) ?
              <div role="alert" className="alert alert-danger alert-dismissible">
                {this.state.errors.message}
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

module.exports = Login;
