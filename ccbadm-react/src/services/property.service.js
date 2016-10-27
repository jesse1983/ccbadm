const apiFactory = require('./../factories/api.factory');

class PropertyService {
  static getAll() {
    const search = {};
    search.expand = 'church';
    search.limit = search.limit || 12;
    search.offset = search.offset || 0;
    return apiFactory.list('properties', search, '0ffe5079b7d713b5f1c841e62e91a4f8');
  }
}
module.exports = PropertyService;
