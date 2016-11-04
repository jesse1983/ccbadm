const Reflux = require('reflux');

const loginActions = Reflux.createActions(['update']);

const loginStore = Reflux.createStore({
  listenables: loginActions,
  init: function fn() {
    this.state = { };
  },
  onUpdate: function fn(currentUser) {
    this.state = currentUser;
    this.trigger(currentUser);
  },
});

module.exports = { loginStore, loginActions };
