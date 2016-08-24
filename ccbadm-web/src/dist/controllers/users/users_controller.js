angular.module('CCBApp').controller("UsersController", [
  '$scope', '$location', '$rootScope', '$cookieStore', 'ApiFactory', function($scope, $location, $rootScope, $cookieStore, ApiFactory) {
    $scope.title = "Usuários";
    $rootScope.nav = {
      current: {
        title: "Usuários"
      },
      button: {
        label: "Novo",
        action: function() {
          return $location.path("users/new");
        }
      }
    };
    $scope.getUsers = function(offset) {
      return ApiFactory.User().query({
        offset: offset,
        limit: 12,
        expand: "profile"
      }, function(data) {
        return $scope.users = data;
      });
    };
    $scope.goto = function(user_id) {
      return $location.path("users/" + user_id);
    };
    return $scope.getUsers(0);
  }
]);
