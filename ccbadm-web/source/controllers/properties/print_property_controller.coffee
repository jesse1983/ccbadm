angular.module('CCBApp').controller "PrintPropertyController", ['$scope','$routeParams','$location','ApiFactory','$rootScope',($scope,$routeParams,$location,ApiFactory,$rootScope) ->
	$scope.query = $routeParams
	$scope.property = null

	# $scope.properties = {}

	ApiFactory.Property().get {id: $routeParams.id,expand: "church"}, (json) ->
		$scope.property = json
		$rootScope.nav =
			current:
				title: "Impressão"
			back:
				title: $scope.property.title
				url: "properties/#{$scope.property.id}"
			button:
				label: "Imprimir"
				action: () ->
					window.print()
		ApiFactory.Document().query {documentable_id_eq: $scope.property.id, documentable_type_eq: "Property",expand: "document_type", limit: 50}, (json) ->
			$scope.documents = json.data
			$scope.url = window.location.href
			$scope.ready = true
		$scope.map =
			center:
				latitude: $scope.property.latitude,
				longitude: $scope.property.longitude
			zoom: 16


	$scope.range = (index,col) ->
		if $scope.documents?
			l = $scope.documents.length
			start = l/3 * col
			end = start + l/3
			index >= start and index <= end
		else
			0

]
