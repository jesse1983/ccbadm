var indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

angular.module('CCBApp').run(function($http, $cookieStore, ApiFactory, $rootScope, $location, $uibModalStack, $route, CONSTANTS) {
  var auth_cookie, current_user, error, error1, myURL;
  auth_cookie = $cookieStore.get("token");
  $http.defaults.headers.common;
  if (window.location.hash.indexOf("#/login") > -1) {
    myURL = null;
  } else {
    myURL = window.location.href.split('#')[1];
    if (myURL != null) {
      myURL = myURL.split("redirectURL")[0];
    }
  }
  if (auth_cookie != null) {
    try {
      current_user = JSON.parse(auth_cookie);
    } catch (error1) {
      error = error1;
      current_user = auth_cookie;
    }
    ApiFactory.Set(current_user.token);
    $http({
      url: CONSTANTS.API_URL + "/api/login",
      method: "GET",
      headers: {
        Authorization: current_user.token
      }
    }).then(function(response) {
      return $rootScope.login = response.data.data;
    }, function(error) {
      var ref;
      $rootScope.login = null;
      if ((ref = error.status) === 401 || ref === 403 || ref === 404 || ref === 500) {
        return $location.path("/logout").search({
          redirectURL: myURL
        });
      }
    });
  } else {
    $location.path("/logout").search({
      redirectURL: myURL
    });
  }
  $rootScope.can = function(action, resource) {
    var can, r;
    can = false;
    if ($rootScope.login != null) {
      r = _.where($rootScope.login.skills, {
        resource: resource
      });
      if (r.length > 0) {
        if (indexOf.call(r[0].can, action) >= 0) {
          can = true;
        }
        if (indexOf.call(r[0].can, "manage") >= 0) {
          can = true;
        }
      }
    }
    return can;
  };
  $rootScope.$on('$routeChangeStart', (function(_this) {
    return function() {
      return $uibModalStack.dismissAll();
    };
  })(this));
  $rootScope.ChangeUrl = function(title, url) {
    var obj;
    if (typeof history.pushState !== "undefined") {
      obj = {
        Title: title,
        Url: url
      };
      history.pushState(obj, obj.Title, obj.Url);
    }
  };
});
