CCBApp = angular.module 'CCBApp', ['ngResource','ngAnimate','ngRoute','ngCookies', 'ui.bootstrap','angularMoment', 'ngFileUpload','cgPrompt','monospaced.qrcode','uiGmapgoogle-maps']

CCBApp.run ($http, $cookieStore,ApiFactory,$rootScope,$location) ->
  $http.defaults.headers.common
  # If Token exists
  if $cookieStore.get("token")
    $http
      url: "api/login"
      method: "GET"
      headers:
        Authorization: $cookieStore.get("token").token
    .then (response) ->
      $rootScope.login = response.data.data
      $http.defaults.headers.common["Authorization"] = $cookieStore.get("token").token
    ,(error)->
      $rootScope.login = null
      # Unauthorized
      if error.status == 401 || error.status == 403
        $location.path("/logout").search(redirectURL: window.location.href.split('#')[1])
  else
    $location.path("/logout").search(redirectURL: window.location.href.split('#')[1])

  # CanCan
  $rootScope.can = (action,resource)->
    can = false
    if $rootScope.login?
      r =  _.where $rootScope.login.skills, {resource: resource}
      if r.length > 0
        if action in r[0].can
          can = true
        if "manage" in r[0].can
          can = true
    can



CCBApp.config ['$routeProvider','$httpProvider',($routeProvider,$httpProvider) ->
  cancan = (action,resource) ->
    can: ($q,$rootScope,$timeout,prompt)->
      defer = $q.defer()

      $rootScope.$watch 'login', (n,o)->
        if n?
          if $rootScope.can action,resource
            defer.resolve("OK")
          else
            prompt
              title: 'Acesso negado',
              message: 'Desculpe, mas você não tem permissão para acessar esse link'
            defer.reject "Cannot"
      # if $rootScope.login?
      #   if $rootScope.can action,resource
      #     defer.resolve("OK")
      #   else
      #     $timeout ()->
      #       console.log "timeout", action,resource
      #       if $rootScope.can action,resource
      #         defer.resolve("OK")
      #       else
      #         prompt
      #           title: 'Acesso negado',
      #           message: 'Desculpe, mas você não tem permissão para acessar esse link'
      #         defer.reject "Cannot"
      #     ,2000
      # else
      #   defer.reject "Cannot"
      defer.promise

  $routeProvider
  .when '/login',
    templateUrl: '/views/login/index.html'
    controller: 'LoginController'
  .when '/logout',
    template: ''
    controller: 'LogoutController'
  .when '/properties',
    templateUrl: '/views/properties/index.html'
    controller: 'PropertiesController'
    resolve: cancan("show","Property")
  .when '/properties/:id',
    templateUrl: '/views/properties/show.html'
    controller: 'PropertyController'
    resolve: cancan("show","Property")    
  .when '/properties/:id/print',
    templateUrl: '/views/properties/print.html'
    controller: 'PrintPropertyController'
    resolve: cancan("show","Property")
  .when '/properties/:property_id/documents/:id',
    templateUrl: '/views/documents/show.html'
    controller: 'DocumentController'
    resolve: cancan("show","Document")
  .when '/users',
    templateUrl: '/views/users/index.html'
    controller: 'UsersController'
    resolve: cancan("show","User")
  .when '/users/:id',
    templateUrl: '/views/users/show.html'
    controller: 'UserController'
    resolve: cancan("show","User")
  .when '/users/new',
    templateUrl: '/views/users/show.html'
    controller: 'UserController'
    resolve: cancan("create","User")
  .when '/',{redirectTo: "/properties"}


]
