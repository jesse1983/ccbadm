angular.module('CCBApp').directive('paginalize', [
  '$document', '$location', function($document, $location) {
    return {
      restrict: 'E',
      templateUrl: "directives/paginalize/paginalize_directive.html",
      replace: false,
      scope: {
        object: "=",
        method: "=?",
        limit: "=?"
      },
      controller: function($scope) {
        $scope.limit = $scope.limit || 12;
        $scope.$watch("object", function(n, o) {
          if ($scope.object != null) {
            $scope.page = Math.round($scope.object.offset / $scope.limit) + 1;
          }
        });
        $scope.next = function() {
          if ($scope.object.offset < ($scope.object.total - $scope.limit)) {
            if ($scope.method) {
              return $scope.method($scope.object.offset + $scope.limit);
            }
          }
        };
        $scope.previous = function() {
          if ($scope.object.offset >= $scope.limit) {
            if ($scope.method) {
              return $scope.method($scope.object.offset - $scope.limit);
            }
          }
        };
        return $scope.hasPagination = function() {
          if ($scope.object) {
            return $scope.object.total > $scope.limit;
          }
          return false;
        };
      }
    };
  }
]);
