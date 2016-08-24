angular.module('CCBApp').controller "UsersController", ['$scope','$location','$rootScope','$cookieStore','ApiFactory',($scope,$location,$rootScope,$cookieStore,ApiFactory) ->
	
	$scope.title = "Usuários"
	$rootScope.nav = 
		current:
			title: "Usuários"
		button:
			label: "Novo"
			action: () ->
				$location.path "users/new"
	$scope.getUsers = (offset) ->
		ApiFactory.User.query
			offset: offset
			limit: 12
			expand: "profile"
		,(data) ->
			$scope.users = data


	$scope.goto = (user_id) ->
		$location.path "users/#{user_id}"
	$scope.getUsers(0)


]
