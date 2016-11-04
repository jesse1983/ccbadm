const apiFactory = require('./../factories/api.factory');

class LoginService {
  static login(email, password) {
    const data = { email, password };
    return apiFactory.create('login', data, false);
  }
  static logout(auth) {
    return apiFactory.destroy('login', auth);
  }
}

module.exports = LoginService;
