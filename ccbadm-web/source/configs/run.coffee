angular
  .module('CCBApp')
  .run ($http, $cookieStore, ApiFactory, $rootScope, $location, $uibModalStack, $route, CONSTANTS) ->
    auth_cookie = $cookieStore.get("token")
    $http.defaults.headers.common
    # If Token exists
    if window.location.hash.indexOf("#/login") > -1
      myURL = null
    else
      myURL = window.location.href.split('#')[1]
      myURL = myURL.split("redirectURL")[0] if myURL?
    if auth_cookie?
      try
        current_user = JSON.parse auth_cookie
      catch error
        current_user = auth_cookie
      ApiFactory.Set current_user.token
      $http
        url: "#{CONSTANTS.API_URL}/api/login"
        method: "GET"
        headers:
          Authorization: current_user.token
      .then (response) ->
        $rootScope.login = response.data.data

      ,(error)->
        $rootScope.login = null
        # Unauthorized
        if error.status in [401,403,404,500]
          $location.path("/logout").search(redirectURL: myURL)
    else
      $location.path("/logout").search(redirectURL: myURL)

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
    # Modals
    $rootScope.$on '$routeChangeStart', =>
      $uibModalStack.dismissAll()

    $rootScope.ChangeUrl = (title, url)->
      if typeof (history.pushState) != "undefined"
        obj = { Title: title, Url: url }
        history.pushState(obj, obj.Title, obj.Url)
      return

    return