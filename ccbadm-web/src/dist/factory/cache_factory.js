var CacheFactory;

CacheFactory = function() {
  var cache;
  cache = {};
  return {
    get: function(key) {
      return cache[key] || null;
    },
    set: function(key, value) {
      return cache[key] = value;
    }
  };
};

angular.module('CCBApp').factory('CacheFactory', CacheFactory);
