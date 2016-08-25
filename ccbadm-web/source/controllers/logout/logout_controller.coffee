angular.module('CCBApp').controller "LogoutController", ['$location','$rootScope','$cookieStore','$http','CONSTANTS',($location,$rootScope,$cookieStore,$http,CONSTANTS) ->


	cleanAll = ()->
		$cookieStore.remove("token")
		$cookieStore.remove("auth")
		$http.defaults.headers.common = {}
		$rootScope.login = null
		$location.path "/login"

	if $cookieStore.get("token")?
		$http
			url: "#{CONSTANTS.API_URL}/api/login"
			method: "DELETE"
			headers:
				Authorization: $cookieStore.get("auth")
		.then (response) ->
			cleanAll()
		,(error)->
			cleanAll()
	else
		cleanAll()

]
