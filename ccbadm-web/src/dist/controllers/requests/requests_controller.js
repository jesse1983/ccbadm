var RequestsController,
  bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

RequestsController = (function() {
  function RequestsController(cookieStore, rootScope, uibModal, ApiFactory, location, timeout) {
    this.cookieStore = cookieStore;
    this.rootScope = rootScope;
    this.uibModal = uibModal;
    this.ApiFactory = ApiFactory;
    this.location = location;
    this.timeout = timeout;
    this.GetRequests = bind(this.GetRequests, this);
    this.title = "Retiradas";
    this.rootScope.nav = {
      current: {
        title: "Retiradas"
      },
      button: {
        label: "Nova",
        action: (function(_this) {
          return function() {
            return _this.location.path("requests/new");
          };
        })(this)
      }
    };
    this.GetRequests();
  }

  RequestsController.prototype.GetRequests = function(offset, active) {
    var params;
    if (offset == null) {
      offset = 0;
    }
    if (active == null) {
      active = true;
    }
    this.request = null;
    this.requests = null;
    this.requests_total = null;
    this.loading = true;
    params = {
      is_active_eq: active,
      sorts: "created_at desc",
      limit: 12,
      offset: offset
    };
    this.ApiFactory.Request().query(params, (function(_this) {
      return function(json) {
        _this.requests = json;
        _this.requests_total = json.total;
        return _this.loading = false;
      };
    })(this));
  };

  RequestsController.prototype.OpenRequest = function(request) {
    return this.ApiFactory.Request().get({
      id: request.id,
      expand: "user"
    }, (function(_this) {
      return function(json) {
        _this.request = json;
        return _this.modalInstance = _this.uibModal.open({
          controller: function($scope, $uibModalInstance) {
            $scope.request = _this.request;
            $scope.ModalCancel = function() {
              return $uibModalInstance.dismiss('cancel');
            };
            return $scope.GetBackRequest = function() {
              $scope.request.returned_at = moment().format();
              $scope.request.is_active = moment().format();
              $scope.request.$update();
              request.is_active = false;
              _this.requests_total = _this.requests_total - 1;
              _this.timeout(function() {
                return $scope.$digest();
              }, 100);
              return $scope.ModalCancel();
            };
          },
          templateUrl: "modal.html",
          size: "lg"
        });
      };
    })(this));
  };

  return RequestsController;

})();

RequestsController.$inject = ['$cookieStore', '$rootScope', '$uibModal', 'ApiFactory', '$location', '$timeout'];

angular.module("CCBApp").controller("RequestsController", RequestsController);
