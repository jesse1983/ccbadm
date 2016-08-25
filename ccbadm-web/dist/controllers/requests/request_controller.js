var RequestController;

RequestController = (function() {
  function RequestController(cookieStore, rootScope, ApiFactory, location, prompt) {
    this.cookieStore = cookieStore;
    this.rootScope = rootScope;
    this.ApiFactory = ApiFactory;
    this.location = location;
    this.prompt = prompt;
    this.request = {
      is_active: true
    };
    this.title = "Nova retirada";
    this.rootScope.nav = {
      current: {
        title: "Nova retirada"
      },
      back: {
        title: "Retiradas",
        url: "requests"
      },
      button: {
        label: "Salvar",
        action: (function(_this) {
          return function() {
            return _this.Save();
          };
        })(this)
      }
    };
    this.GetChurches();
  }

  RequestController.prototype.CurrentUser = function() {
    var current_user;
    current_user = this.rootScope.login;
    return current_user;
  };

  RequestController.prototype.GetChurches = function() {
    this.loading = "churches";
    this.documents = null;
    this.properties = null;
    this.requestable_id = null;
    return this.ApiFactory.Church().query({
      limit: 100
    }, (function(_this) {
      return function(data) {
        delete _this.loading;
        return _this.churches = data.data;
      };
    })(this));
  };

  RequestController.prototype.GetProperties = function(church_id) {
    this.loading = "properties";
    this.documents = null;
    this.properties = null;
    this.requestable_id = null;
    return this.ApiFactory.Property().query({
      limit: 100,
      church_id: church_id
    }, (function(_this) {
      return function(data) {
        delete _this.loading;
        return _this.properties = data.data;
      };
    })(this));
  };

  RequestController.prototype.GetDocuments = function(property_id) {
    this.loading = "documents";
    this.documents = null;
    this.requestable_id = null;
    return this.ApiFactory.Document().query({
      limit: 30,
      documentable_id_eq: property_id,
      expand: "document_type"
    }, (function(_this) {
      return function(data) {
        delete _this.loading;
        return _this.documents = data.data;
      };
    })(this));
  };

  RequestController.prototype.Save = function() {
    var factory, request_instance;
    this.submitted = true;
    if (this.form.$valid) {
      this.request.is_active = true;
      this.request.user_id = this.CurrentUser().id;
      this.request.requestable_type = "Document";
      factory = this.ApiFactory.Request();
      request_instance = new factory(this.request);
      return request_instance.$save((function(_this) {
        return function() {
          return _this.prompt({
            title: 'Salvo com sucesso',
            message: 'A retirada do documento foi salva com sucesso',
            buttons: [
              {
                label: 'OK',
                primary: true
              }
            ]
          }).then(function() {
            return _this.location.path("requests");
          });
        };
      })(this));
    } else {
      return this.prompt({
        title: 'Informações pendentes',
        message: "Alguns informações ainda não foram preenchidas",
        buttons: [
          {
            label: 'OK',
            cancel: true
          }
        ]
      });
    }
  };

  return RequestController;

})();

RequestController.$inject = ['$cookieStore', '$rootScope', 'ApiFactory', '$location', 'prompt'];

angular.module("CCBApp").controller("RequestController", RequestController);
