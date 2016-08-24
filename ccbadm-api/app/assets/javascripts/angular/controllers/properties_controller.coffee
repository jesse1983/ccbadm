angular.module('CCBApp').controller "PropertiesController", ['$scope','$location','ApiFactory','$rootScope','$cookieStore',($scope,$location,ApiFactory,$rootScope,$cookieStore) ->
	query = $location.search()
	$scope.properties = {}
	$scope.title = "Imóveis"
	$rootScope.nav = 
		current:
			title: "Imóveis"


	$scope.getProperties = (offset) ->
		$scope.loading = true
		$scope.properties = {}
		ApiFactory.Property.query
			offset: offset
			limit: 12
			expand: "church"
			code_or_church_name_or_title_cont: query.q
		,(data) ->
			$scope.loading = false
			$scope.properties = data
	$scope.getProperties(0)

	$scope.goto = (id) ->
		$location.path "/properties/#{id}"
]
