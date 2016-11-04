const Reflux = require('reflux');

const propertyActions = Reflux.createActions(['update']);

const propertyStore = Reflux.createStore({
  listenables: propertyActions,
  init: function fn() {
    this.state = { };
  },
  onUpdate: function fn(obj) {
    this.state = obj;
    this.trigger(obj);
  },
});

module.exports = { propertyStore, propertyActions };
