var PropertyController;

PropertyController = function($scope, $routeParams, $location, ApiFactory, $rootScope, $uibModal, DocumentService, CacheFactory) {
  $scope.query = $routeParams;
  $scope.property = null;
  $scope.document_types = null;
  $scope.documents = null;
  $scope.document_type = null;
  ApiFactory.Property().get({
    id: $routeParams.id,
    expand: "church"
  }, function(json) {
    $scope.property = json;
    $rootScope.nav = {
      current: {
        title: $scope.property.title
      },
      back: {
        title: "Imóveis",
        url: "properties"
      }
    };
    return ApiFactory.Status().query({
      statusable_type_eq: "Document"
    }, function(json) {
      $scope.statuses = json.data;
      return $scope.GetDocumentsStatus();
    });
  });
  $scope.GetDocumentsStatus = (function(_this) {
    return function() {
      var s, search;
      for (s in $scope.statuses) {
        delete $scope.statuses[s].documents;
      }
      search = {
        documentable_id_eq: $scope.property.id,
        documentable_type_eq: "Property"
      };
      return DocumentService.groupByStatus($scope.statuses, search).then(function(results) {
        $scope.ready = true;
        if ($routeParams.document_id) {
          return $scope.gotoDocument($scope.property, $routeParams.document_id);
        }
      });
    };
  })(this);
  $scope.GetStatuses = function() {
    if ($scope.ready) {
      return CacheFactory.get('DocumentService::groupByStatus');
    } else {
      return null;
    }
  };
  $scope.openDocument = function(property, document) {
    return $location.path("/properties/" + property.id + "/documents/" + document.id);
  };
  $scope.gotoDocument = function(property, document_id) {
    return $uibModal.open({
      controller: 'DocumentController as vm',
      templateUrl: "/controllers/properties/documents/document_view.html",
      size: "lg",
      resolve: {
        current_document: (function(_this) {
          return function() {
            return ApiFactory.Document().get({
              id: document_id,
              expand: "attachments,comments,document_type,requests"
            });
          };
        })(this),
        statuses: function() {
          return $scope.statuses;
        },
        ApiFactory: function() {
          return ApiFactory;
        }
      }
    });
  };
  return $scope.statusClass = function(document) {
    var status;
    if (document.is_active === true) {
      if (document.attachments_count > 0) {
        status = "palette-nephritis";
      } else {
        status = "palette-sun-flower";
      }
      if (document.expires_at != null) {
        if (new Date(document.expires_at) < new Date()) {
          status = "palette-pomegranate";
        }
      }
    } else {
      if (document.is_possible) {
        status = "palette-clouds";
      } else {
        status = "palette-wet-asphalt";
      }
    }
    return status;
  };
};

PropertyController.$inject = ['$scope', '$routeParams', '$location', 'ApiFactory', '$rootScope', '$uibModal', 'DocumentService', 'CacheFactory'];

angular.module('CCBApp').controller("PropertyController", PropertyController);
