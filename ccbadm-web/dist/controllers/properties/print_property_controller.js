angular.module('CCBApp').controller("PrintPropertyController", [
  '$scope', '$routeParams', '$location', 'ApiFactory', '$rootScope', function($scope, $routeParams, $location, ApiFactory, $rootScope) {
    $scope.query = $routeParams;
    $scope.property = null;
    ApiFactory.Property().get({
      id: $routeParams.id,
      expand: "church"
    }, function(json) {
      $scope.property = json;
      $rootScope.nav = {
        current: {
          title: "Impressão"
        },
        back: {
          title: $scope.property.title,
          url: "properties/" + $scope.property.id
        },
        button: {
          label: "Imprimir",
          action: function() {
            return window.print();
          }
        }
      };
      ApiFactory.Document().query({
        documentable_id_eq: $scope.property.id,
        documentable_type_eq: "Property",
        expand: "document_type",
        limit: 50
      }, function(json) {
        $scope.documents = json.data;
        $scope.url = window.location.href;
        return $scope.ready = true;
      });
      return $scope.map = {
        center: {
          latitude: $scope.property.latitude,
          longitude: $scope.property.longitude
        },
        zoom: 16
      };
    });
    return $scope.range = function(index, col) {
      var end, l, start;
      if ($scope.documents != null) {
        l = $scope.documents.length;
        start = l / 3 * col;
        end = start + l / 3;
        return index >= start && index <= end;
      } else {
        return 0;
      }
    };
  }
]);
