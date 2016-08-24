angular.module('CCBApp').controller "LoginController", ['$scope','$location','$routeParams','ApiFactory','$rootScope','$cookieStore','$http',($scope,$location,$routeParams,ApiFactory,$rootScope,$cookieStore,$http) ->
	# Auth
	$scope.logon = ()->
		$scope.error = null
		if $scope.user.email? and $scope.user.password?
			$http
				url: "api/login"
				method: "POST"
				data: 
					email: $scope.user.email
					password: $scope.user.password
			.then (response) ->
				$cookieStore.put("token",response.data.data)
				$http.defaults.headers.common["Authorization"] = $cookieStore.get("token").token
				if $routeParams.redirectURL?
					$location.path(decodeURIComponent($routeParams.redirectURL)).search({})
				else
					$location.path("/")
				$rootScope.login = response.data.data
				# $scope.token = $cookieStore.get("token")
			,(error)->
				$scope.error = error.data
		else
			$scope.error = {error: "E-mail e senha devem ser preenchidos"}
]
