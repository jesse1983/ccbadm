angular.module('CCBApp').directive 'paginalize', ['$document','$location',($document,$location) ->
  restrict: 'E'
  # templateUrl: "<%= asset_path('angular/directives/paginalize/paginalize_template.html') %>"
  templateUrl: "directives/paginalize/paginalize_directive.html"
  replace: false
  scope:
    object: "="
    method: "=?"
    limit: "=?"
  controller: ($scope) ->
    $scope.limit = $scope.limit || 12

    $scope.$watch "object", (n,o) ->
      if $scope.object?
        $scope.page = Math.round($scope.object.offset / $scope.limit) + 1
      return

    $scope.next = () ->
      if $scope.object.offset < ($scope.object.total - $scope.limit)
        $scope.method $scope.object.offset + $scope.limit if $scope.method

    $scope.previous = () ->
      if $scope.object.offset >= $scope.limit
        $scope.method $scope.object.offset - $scope.limit if $scope.method

    $scope.hasPagination = () ->
      if $scope.object
        return ($scope.object.total > $scope.limit)
      return false

  # link: (scope, elem, attr, ctrl) ->

]
