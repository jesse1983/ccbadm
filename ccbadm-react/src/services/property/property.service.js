const apiFactory = require('./../../factories/api.factory');
const propertyStore = require('./property.reflux').propertyStore;
const propertyActions = require('./property.reflux').propertyActions;
const Auth = require('./../../auth');

class PropertyService {
  static getAll(auth = null) {
    const authorize = auth || Auth.logged();
    const search = {};
    search.expand = 'church';
    search.limit = search.limit || 12;
    search.offset = search.offset || 0;
    return apiFactory.list('properties', search, authorize, propertyActions);
  }
  static store() {
    return propertyStore;
  }
}
module.exports = PropertyService;
