angular.module('CCBApp').config([
  '$routeProvider', '$httpProvider', function($routeProvider, $httpProvider) {
    var cancan, view_path;
    view_path = function(resource, view) {
      return "/controllers/" + resource + "/" + view + "_view.html";
    };
    cancan = function(action, resource) {
      return {
        can: function($q, $rootScope, $timeout, prompt) {
          var defer;
          defer = $q.defer();
          $rootScope.$watch('login', function(n, o) {
            if (n != null) {
              if ($rootScope.can(action, resource)) {
                return defer.resolve("OK");
              } else {
                prompt({
                  title: 'Acesso negado',
                  message: 'Desculpe, mas você não tem permissão para acessar esse link'
                });
                return defer.reject("Cannot");
              }
            }
          });
          return defer.promise;
        }
      };
    };
    return $routeProvider.when('/login', {
      templateUrl: view_path('login', 'login'),
      controller: 'LoginController',
      controllerAs: 'vm'
    }).when('/logout', {
      template: '',
      controller: 'LogoutController',
      controllerAs: 'vm'
    }).when('/properties', {
      templateUrl: view_path('properties', 'properties'),
      controller: 'PropertiesController',
      controllerAs: 'vm',
      resolve: cancan("show", "Property")
    }).when('/properties/:id', {
      templateUrl: view_path('properties', 'property'),
      controller: 'PropertyController',
      controllerAs: 'vm',
      resolve: cancan("show", "Property"),
      reloadOnSearch: false
    }).when('/properties/:id/print', {
      templateUrl: view_path('properties', 'print_property'),
      controller: 'PrintPropertyController',
      controllerAs: 'vm',
      resolve: cancan("show", "Property")
    }).when('/properties/:id/documents/:document_id', {
      templateUrl: view_path('properties', 'property'),
      controller: 'PropertyController',
      controllerAs: 'vm',
      resolve: cancan("show", "Property"),
      reloadOnSearch: false
    }).when('/requests', {
      templateUrl: view_path('requests', 'requests'),
      controller: 'RequestsController',
      controllerAs: 'vm'
    }).when('/requests/new', {
      templateUrl: view_path('requests', 'request'),
      controller: 'RequestController',
      controllerAs: 'vm'
    }).when('/users', {
      templateUrl: view_path('users', 'users'),
      controller: 'UsersController',
      controllerAs: 'vm',
      resolve: cancan("show", "User")
    }).when('/users/:id', {
      templateUrl: view_path('users', 'user'),
      controller: 'UserController',
      controllerAs: 'vm',
      resolve: cancan("show", "User")
    }).when('/users/new', {
      templateUrl: view_path('users', 'user'),
      controller: 'UserController',
      controllerAs: 'vm',
      resolve: cancan("create", "User")
    }).when('/profiles', {
      template: '<profiles-controller />'
    }).when('/', {
      redirectTo: "/properties"
    });
  }
]);
