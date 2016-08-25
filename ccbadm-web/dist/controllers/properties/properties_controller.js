angular.module('CCBApp').controller("PropertiesController", [
  '$scope', '$location', 'ApiFactory', '$rootScope', '$cookieStore', function($scope, $location, ApiFactory, $rootScope, $cookieStore) {
    $scope.query = $location.search();
    $scope.properties = {};
    $scope.title = "Imóveis";
    $rootScope.nav = {
      current: {
        title: "Imóveis"
      }
    };
    $scope.getProperties = function(offset) {
      $scope.loading = true;
      $scope.notFound = false;
      $scope.properties = {};
      return ApiFactory.Property().query({
        offset: offset,
        limit: 12,
        expand: "church",
        code_or_church_name_or_title_cont: $scope.query.q
      }, function(data) {
        $scope.loading = false;
        $scope.properties = data;
        if (($scope.query.q != null) && data.total === 0) {
          return $scope.notFound = true;
        }
      });
    };
    $scope.getProperties(0);
    return $scope.goto = function(id) {
      return $location.path("/properties/" + id);
    };
  }
]);
