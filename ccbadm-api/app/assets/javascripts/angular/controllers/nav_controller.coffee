angular.module('CCBApp').controller "NavController", ['$scope','$location','$cookieStore','$http','$rootScope',($scope,$location,$cookieStore,$http,$rootScope) ->

	$scope.formSearch = {}
	$scope.submitSearch = (is_valid) ->
		if is_valid
			$location.path("/properties").search({q: $scope.formSearch.q})
			$scope.formSearch.q = ""
		$scope.showSearch = false
		true



]