
/**
 * LoginController
 * @param {string} $scope Default scope
 * @param {string} $location Location module
 * @param {string} $routeParams RouteParams module
 */
var LoginController;

LoginController = function($scope, $location, $routeParams, ApiFactory, $rootScope, $cookieStore, $http, CONSTANTS) {
  var init, logon, vm;
  vm = this;
  init = (function(_this) {
    return function() {
      vm.error = null;
      vm.loading = false;
      vm.logon = logon;
      return vm.user = {};
    };
  })(this);

  /**
  	* Function to logon
   */
  logon = function() {
    if ((vm.user.email != null) && (vm.user.password != null)) {
      vm.loading = true;
      $http.defaults.useXDomain = true;
      $http({
        url: CONSTANTS.API_URL + "/api/login",
        method: "POST",
        data: {
          email: vm.user.email,
          password: vm.user.password
        }
      }).then(function(response) {
        vm.loading = null;
        $cookieStore.put("token", JSON.stringify(response.data.data));
        $cookieStore.put("auth", response.data.data.token.toString().trim());
        ApiFactory.Set(response.data.data.token.toString().trim());
        if ($routeParams.redirectURL != null) {
          $location.path(decodeURIComponent($routeParams.redirectURL)).search({});
        } else {
          $location.path("/");
        }
        return $rootScope.login = response.data.data;
      }, function(error) {
        vm.loading = null;
        return vm.error = error.data;
      });
    } else {
      vm.error = {
        error: "E-mail e senha devem ser preenchidos"
      };
    }
  };
  init();
};

LoginController.$inject = ['$scope', '$location', '$routeParams', 'ApiFactory', '$rootScope', '$cookieStore', '$http', 'CONSTANTS'];

angular.module('CCBApp').controller("LoginController", LoginController);
