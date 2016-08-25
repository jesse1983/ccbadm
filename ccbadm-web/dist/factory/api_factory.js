angular.module("CCBApp").factory("ApiFactory", [
  '$resource', 'CONSTANTS', '$cookieStore', function($resource, CONSTANTS) {
    var config, headers, interceptor, methods, source;
    source = CONSTANTS.API_URL + "/api";
    headers = {
      Authorization: null
    };
    interceptor = {
      responseError: function(error) {
        var ref;
        if ((ref = error.status) === 403 || ref === 401 || ref === 404) {
          return window.location.href = "/#/logout";
        }
      }
    };
    config = function(cache) {
      return {
        query: {
          headers: headers,
          interceptor: interceptor,
          method: 'GET',
          isArray: false,
          cache: cache
        },
        get: {
          headers: headers,
          interceptor: interceptor,
          transformResponse: function(response, header) {
            return angular.fromJson(response).data;
          }
        },
        save: {
          headers: headers,
          interceptor: interceptor,
          method: 'POST'
        },
        create: {
          headers: headers,
          interceptor: interceptor,
          method: 'POST'
        },
        update: {
          headers: headers,
          interceptor: interceptor,
          method: 'PATCH'
        },
        "delete": {
          headers: headers,
          interceptor: interceptor,
          method: 'DELETE',
          params: {
            id: "@id"
          },
          method: "DELETE",
          isArray: false
        }
      };
    };
    methods = {
      Set: function(value) {
        return headers.Authorization = value;
      },
      Attachment: function() {
        return $resource(source + "/attachments/:id", {
          id: '@id'
        }, config(true));
      },
      Church: function() {
        return $resource(source + "/churches/:id", {
          id: '@id'
        }, config(true));
      },
      Document: function() {
        return $resource(source + "/documents/:id", {
          id: '@id'
        }, config(false));
      },
      DocumentType: function() {
        return $resource(source + "/document_types/:id", {
          id: '@id'
        }, config(true));
      },
      Login: function() {
        return $resource(source + "/login", {}, config(false));
      },
      Property: function() {
        return $resource(source + "/properties/:id", {
          id: '@id'
        }, config(true));
      },
      Profile: function() {
        return $resource(source + "/profiles/:id", {
          id: '@id'
        }, config(true));
      },
      Request: function() {
        return $resource(source + "/requests/:id", {
          id: '@id'
        }, config(false));
      },
      Status: function() {
        return $resource(source + "/statuses/:id", {
          id: '@id'
        }, config(true));
      },
      Comment: function() {
        return $resource(source + "/comments/:id", {
          id: '@id'
        }, config(true));
      },
      User: function() {
        return $resource(source + "/users/:id", {
          id: '@id'
        }, config(false));
      }
    };
    return methods;
  }
]);
