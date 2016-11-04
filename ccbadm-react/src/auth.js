const Cookies = require('js-cookie');
const browserHistory = require('react-router').browserHistory;
const loginService = require('./services/login.service');
const loginStore = require('./services/login.reflux').loginStore;
const loginActions = require('./services/login.reflux').loginActions;

class Auth {
  static logged(cookies = null) {
    let token = null;
    if (cookies) token = cookies.get('currentUser');
    if (loginStore.state.token) token = loginStore.state.token;
    if (!token) token = Cookies.get('currentUser');
    return token;
  }

  static logout() {
    loginService.logout(Auth.logged()).then(() => {
      Cookies.remove('currentUser');
      loginActions.update(null);
      browserHistory.push('/login');
    });
  }

  static login(email, password) {
    return new Promise((resolve, reject) => {
      loginService.login(email, password).then((result) => {
        Cookies.set('currentUser', result.token);
        loginActions.update(result);
        browserHistory.push('/');
        resolve(result.data);
      }, (err) => {
        reject(err);
      });
    });
  }

  static requireAuth(nextState, replace) {
    if (!Auth.logged(Cookies)) {
      replace({
        pathname: '/login',
        state: {
          nextPathname: nextState.location.pathname,
        },
      });
    }
  }
}

module.exports = Auth;
