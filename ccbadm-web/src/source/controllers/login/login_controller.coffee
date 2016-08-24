###*
# LoginController
# @param {string} $scope Default scope
# @param {string} $location Location module
# @param {string} $routeParams RouteParams module
###
LoginController = ($scope,$location,$routeParams,ApiFactory,$rootScope,$cookieStore,$http,CONSTANTS)->
	vm = @
	init = ()=>
		vm.error = null
		vm.loading = false
		vm.logon = logon
		vm.user = {}
	###*
	* Function to logon
	###
	logon = ()->
		if vm.user.email? and vm.user.password?
			vm.loading = true
			$http.defaults.useXDomain = true
			$http
				url: "#{CONSTANTS.API_URL}/api/login"
				method: "POST"
				data:
					email: vm.user.email
					password: vm.user.password
			.then (response) ->
				vm.loading = null
				$cookieStore.put "token", JSON.stringify(response.data.data)
				$cookieStore.put "auth" , response.data.data.token.toString().trim()

				ApiFactory.Set response.data.data.token.toString().trim()

				if $routeParams.redirectURL?
					$location.path(decodeURIComponent($routeParams.redirectURL)).search({})
				else
					$location.path("/")
				$rootScope.login = response.data.data
				# vm.token = $cookieStore.get("token")
			,(error)->
				vm.loading = null
				vm.error = error.data
		else
			vm.error = {error: "E-mail e senha devem ser preenchidos"}

		return
	init()
	return
LoginController.$inject = ['$scope','$location','$routeParams','ApiFactory','$rootScope','$cookieStore','$http','CONSTANTS']
angular
	.module('CCBApp')
	.controller "LoginController", LoginController
