angular.module('CCBApp').controller "LogoutController", ['$location','$rootScope','$cookieStore','$http',($location,$rootScope,$cookieStore,$http) ->


	cleanAll = ()->
		$cookieStore.remove("token")
		$http.defaults.headers.common = {}
		$rootScope.login = null
		$location.path "/login"		

	if $cookieStore.get("token")?
		$http
			url: "api/login"
			method: "DELETE"
			headers:
				Authorization: $cookieStore.get("token").token
		.then (response) ->
			cleanAll()
		,(error)->
			cleanAll()
	else
		cleanAll()

]
