angular.module("CCBApp").factory("Auth", [
  '$cookieStore', function($cookieStore) {
    var auth;
    auth = null;
    return {
      set: function(value) {
        return auth = value;
      },
      get: function() {
        return auth;
      }
    };
  }
]);
