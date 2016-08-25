class RequestsController
	constructor: (@cookieStore, @rootScope, @uibModal, @ApiFactory, @location, @timeout)->
		@title = "Retiradas"
		@rootScope.nav =
			current:
				title: "Retiradas"
			button:
				label: "Nova"
				action: () => @location.path "requests/new"

		@GetRequests()

	GetRequests: (offset = 0, active = true)=>
		@request = null
		@requests = null
		@requests_total = null
		@loading = true
		params =
			is_active_eq: active
			sorts: "created_at desc"
			limit: 12
			offset: offset
		@ApiFactory.Request().query params, (json)=>
			@requests = json
			@requests_total = json.total
			@loading = false
		return

	OpenRequest: (request)->
		@ApiFactory.Request().get {id: request.id, expand: "user"}, (json)=>
			@request = json
			@modalInstance = @uibModal.open
				controller: ($scope, $uibModalInstance)=>
					$scope.request = @request
					$scope.ModalCancel = ->
						$uibModalInstance.dismiss('cancel')
					$scope.GetBackRequest = =>
						$scope.request.returned_at = moment().format()
						$scope.request.is_active = moment().format()
						$scope.request.$update()
						request.is_active = false
						@requests_total = @requests_total - 1
						@timeout ->
							$scope.$digest()
						,100
						$scope.ModalCancel()

				templateUrl: "modal.html"
				size: "lg"




RequestsController.$inject = ['$cookieStore','$rootScope','$uibModal','ApiFactory','$location','$timeout']

angular.module("CCBApp").controller("RequestsController",RequestsController)