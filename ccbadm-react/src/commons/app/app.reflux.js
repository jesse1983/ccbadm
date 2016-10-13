const Reflux = require('reflux');

const appActions = Reflux.createActions(['update']);

const appStore = Reflux.createStore({
  listenables: appActions,
  init: function fn() {
    this.state = {
      menu: false,
      search: false,
    };
  },
  getState: function fn() { return this.state; },
  onUpdate: function fn(key, value) {
    this.state[key] = value;
    this.trigger(this.state);
  },
});

module.exports = { appStore, appActions };
