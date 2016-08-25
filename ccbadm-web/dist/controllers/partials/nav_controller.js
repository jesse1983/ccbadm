angular.module('CCBApp').controller("NavController", [
  '$scope', '$location', '$cookieStore', '$http', '$rootScope', function($scope, $location, $cookieStore, $http, $rootScope) {
    $scope.back = function() {
      return $location.path($rootScope.nav.back.url);
    };
    $scope.formSearch = {};
    return $scope.submitSearch = function(is_valid) {
      if (is_valid) {
        $location.path("/properties").search({
          q: $scope.formSearch.q
        });
        $scope.formSearch.q = "";
      }
      $scope.showSearch = false;
      return true;
    };
  }
]);
