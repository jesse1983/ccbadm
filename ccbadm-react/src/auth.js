const Cookies = require('js-cookie');
const browserHistory = require('react-router').browserHistory;
const loginService = require('./services/login.service');


class Auth {
  static logged(cookies) {
    return cookies.get('currentUser');
  }
  static logout() {
    Cookies.remove('currentUser');
    browserHistory.push('/login');
  }
  static login(email, password) {
    return new Promise((resolve, reject) => {
      loginService.login(email, password).then((result) => {
        Cookies.set('currentUser', result.token);
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
