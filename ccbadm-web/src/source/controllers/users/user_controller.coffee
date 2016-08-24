angular.module('CCBApp').controller "UserController", ['$scope','$location','$rootScope','$cookieStore','ApiFactory','$routeParams','prompt',($scope,$location,$rootScope,$cookieStore,ApiFactory,$routeParams,prompt) ->
	$scope.isNew = true if $routeParams.id == "new"

	$scope.editing = ()->
		$scope.editable = true
		ApiFactory.Profile().query {}, (json) ->
			$scope.profiles = json
			$scope.user.profile = _.where($scope.profiles.data, {id: $scope.user.profile.id})[0] if $scope.user.profile?
			ApiFactory.Church().query {limit: 100}, (json) ->
				$scope.churches = json
				$scope.user.church = _.where($scope.churches.data, {id: $scope.user.church.id})[0]  if $scope.user.church?
	errorSave = (error)->
		$scope.errors = error.data.errors
		true
	$scope.save = ()->
		$scope.submitted = true
		$scope.errors = null
		user = angular.copy $scope.user
		if $scope.form.$valid
			user.profile_id = user.profile.id
			delete user.profile
			user.church_id = user.church.id
			delete user.church
			user.group_id = 1
			if $scope.isNew
				user.$save {},(response) ->
					$location.path "users/#{response.data.id}"
				,(error)->
					errorSave(error)
			else
				delete user.password
				user.$update {}, ()->
					$scope.user = ApiFactory.User().get {id: $routeParams.id,expand: "profile,church"}
					$scope.editable = null
					$rootScope.nav =
						current:
							title: user.first_name
						back:
							title: "Usuários"
							url: "users"
						button:
							label: "Editar"
							action: () ->
								$scope.editable = true
								$scope.editing()
								$rootScope.nav.back.title = "Cancelar"
								$rootScope.nav.button.label = "Salvar"
								$rootScope.nav.button.action = ()-> $scope.save()
				,(error)->
					errorSave(error)

		false
	$scope.remove = ()->
		prompt
			title: 'Remover usuário'
			message: "Deseja realmente remover #{$scope.user.first_name}?"
		.then ()->
			$scope.user.$delete {},(response) ->
				$location.path "users"

	$scope.changePassword = ()->
		prompt
			title: 'Trocar senha'
			message: "Insira a nova senha para #{$scope.user.first_name}:"
			input: true
		.then (password)->
			$scope.user.$update {password: password, expand: "profile,church"}, ()->
				$scope.user = ApiFactory.User().get {id: $routeParams.id,expand: "profile,church"}
	unless $scope.isNew
		$scope.user = ApiFactory.User().get {id: $routeParams.id,expand: "profile,church"}, (json) ->
			$rootScope.nav =
				current:
					title: json.first_name
				back:
					title: "Usuários"
					url: "users"
				button:
					label: "Editar"
					action: () ->
						$scope.editable = true
						$scope.editing()
						$rootScope.nav.back.title = "Cancelar"
						$rootScope.nav.button.label = "Salvar"
						$rootScope.nav.button.action = ()-> $scope.save()
	else
		$scope.user = new ApiFactory.User()
		$rootScope.nav =
			current:
				title: "Novo usuário"
			back:
				title: "Usuários"
				url: "users"
			button:
				label: "Salvar"
				action: ()-> $scope.save()
		$scope.editing()




]
