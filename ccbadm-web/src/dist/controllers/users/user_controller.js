angular.module('CCBApp').controller("UserController", [
  '$scope', '$location', '$rootScope', '$cookieStore', 'ApiFactory', '$routeParams', 'prompt', function($scope, $location, $rootScope, $cookieStore, ApiFactory, $routeParams, prompt) {
    var errorSave;
    if ($routeParams.id === "new") {
      $scope.isNew = true;
    }
    $scope.editing = function() {
      $scope.editable = true;
      return ApiFactory.Profile().query({}, function(json) {
        $scope.profiles = json;
        if ($scope.user.profile != null) {
          $scope.user.profile = _.where($scope.profiles.data, {
            id: $scope.user.profile.id
          })[0];
        }
        return ApiFactory.Church().query({
          limit: 100
        }, function(json) {
          $scope.churches = json;
          if ($scope.user.church != null) {
            return $scope.user.church = _.where($scope.churches.data, {
              id: $scope.user.church.id
            })[0];
          }
        });
      });
    };
    errorSave = function(error) {
      $scope.errors = error.data.errors;
      return true;
    };
    $scope.save = function() {
      var user;
      $scope.submitted = true;
      $scope.errors = null;
      user = angular.copy($scope.user);
      if ($scope.form.$valid) {
        user.profile_id = user.profile.id;
        delete user.profile;
        user.church_id = user.church.id;
        delete user.church;
        user.group_id = 1;
        if ($scope.isNew) {
          user.$save({}, function(response) {
            return $location.path("users/" + response.data.id);
          }, function(error) {
            return errorSave(error);
          });
        } else {
          delete user.password;
          user.$update({}, function() {
            $scope.user = ApiFactory.User().get({
              id: $routeParams.id,
              expand: "profile,church"
            });
            $scope.editable = null;
            return $rootScope.nav = {
              current: {
                title: user.first_name
              },
              back: {
                title: "Usuários",
                url: "users"
              },
              button: {
                label: "Editar",
                action: function() {
                  $scope.editable = true;
                  $scope.editing();
                  $rootScope.nav.back.title = "Cancelar";
                  $rootScope.nav.button.label = "Salvar";
                  return $rootScope.nav.button.action = function() {
                    return $scope.save();
                  };
                }
              }
            };
          }, function(error) {
            return errorSave(error);
          });
        }
      }
      return false;
    };
    $scope.remove = function() {
      return prompt({
        title: 'Remover usuário',
        message: "Deseja realmente remover " + $scope.user.first_name + "?"
      }).then(function() {
        return $scope.user.$delete({}, function(response) {
          return $location.path("users");
        });
      });
    };
    $scope.changePassword = function() {
      return prompt({
        title: 'Trocar senha',
        message: "Insira a nova senha para " + $scope.user.first_name + ":",
        input: true
      }).then(function(password) {
        return $scope.user.$update({
          password: password,
          expand: "profile,church"
        }, function() {
          return $scope.user = ApiFactory.User().get({
            id: $routeParams.id,
            expand: "profile,church"
          });
        });
      });
    };
    if (!$scope.isNew) {
      return $scope.user = ApiFactory.User().get({
        id: $routeParams.id,
        expand: "profile,church"
      }, function(json) {
        return $rootScope.nav = {
          current: {
            title: json.first_name
          },
          back: {
            title: "Usuários",
            url: "users"
          },
          button: {
            label: "Editar",
            action: function() {
              $scope.editable = true;
              $scope.editing();
              $rootScope.nav.back.title = "Cancelar";
              $rootScope.nav.button.label = "Salvar";
              return $rootScope.nav.button.action = function() {
                return $scope.save();
              };
            }
          }
        };
      });
    } else {
      $scope.user = new ApiFactory.User();
      $rootScope.nav = {
        current: {
          title: "Novo usuário"
        },
        back: {
          title: "Usuários",
          url: "users"
        },
        button: {
          label: "Salvar",
          action: function() {
            return $scope.save();
          }
        }
      };
      return $scope.editing();
    }
  }
]);
