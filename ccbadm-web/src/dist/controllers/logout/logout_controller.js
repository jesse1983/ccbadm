angular.module('CCBApp').controller("LogoutController", [
  '$location', '$rootScope', '$cookieStore', '$http', 'CONSTANTS', function($location, $rootScope, $cookieStore, $http, CONSTANTS) {
    var cleanAll;
    cleanAll = function() {
      $cookieStore.remove("token");
      $cookieStore.remove("auth");
      $http.defaults.headers.common = {};
      $rootScope.login = null;
      return $location.path("/login");
    };
    if ($cookieStore.get("token") != null) {
      return $http({
        url: CONSTANTS.API_URL + "/api/login",
        method: "DELETE",
        headers: {
          Authorization: $cookieStore.get("auth")
        }
      }).then(function(response) {
        return cleanAll();
      }, function(error) {
        return cleanAll();
      });
    } else {
      return cleanAll();
    }
  }
]);
