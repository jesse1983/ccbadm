const apiFactory = require('./../factories/api.factory');

class LoginService {
  static login(email, password) {
    const data = { email, password };
    return apiFactory.create('login', data);
  }
  static logout() {

  }
}

module.exports = LoginService;
