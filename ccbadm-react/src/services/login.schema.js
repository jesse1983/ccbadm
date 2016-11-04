const schema = require('js-schema');

const LoginSchema = schema({
  email: /[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$/,
  password: /.{3,}/,
});

module.exports = LoginSchema;
