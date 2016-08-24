PropertyController = ($scope,$routeParams,$location,ApiFactory,$rootScope,$uibModal, DocumentService, CacheFactory) ->
	$scope.query = $routeParams
	$scope.property = null
	$scope.document_types = null
	$scope.documents = null
	$scope.document_type = null

	# $scope.properties = {}


	ApiFactory.Property().get {id: $routeParams.id,expand: "church"}, (json) ->
		$scope.property = json
		$rootScope.nav =
			current:
				title: $scope.property.title
			back:
				title: "Imóveis"
				url: "properties"
		ApiFactory.Status().query {statusable_type_eq: "Document"}, (json) ->
			$scope.statuses = json.data
			$scope.GetDocumentsStatus()

	$scope.GetDocumentsStatus = =>
		for s of $scope.statuses
			delete $scope.statuses[s].documents
		search =
			documentable_id_eq: $scope.property.id
			documentable_type_eq: "Property"
		DocumentService.groupByStatus($scope.statuses, search).then (results)=>
			# $scope.statuses = results
			$scope.ready = true
			if $routeParams.document_id
				$scope.gotoDocument $scope.property, $routeParams.document_id

	$scope.GetStatuses = ->
		if $scope.ready
			CacheFactory.get 'DocumentService::groupByStatus'
		else
			null

	$scope.openDocument = (property, document)->
		$location.path "/properties/#{property.id}/documents/#{document.id}"

	$scope.gotoDocument = (property,document_id)->
		$uibModal.open
			controller: 'DocumentController as vm'
			templateUrl: "/controllers/properties/documents/document_view.html"
			size: "lg"
			resolve:
				current_document: =>
					ApiFactory.Document().get {id: document_id, expand: "attachments,comments,document_type,requests"}
				statuses: -> $scope.statuses
				ApiFactory: -> ApiFactory


	$scope.statusClass = (document)->
		if document.is_active == true
			if document.attachments_count > 0
				status = "palette-nephritis"
			else
				status = "palette-sun-flower"
			if document.expires_at?
				if (new Date(document.expires_at) < new Date())
					status = "palette-pomegranate"
		else
			if document.is_possible
				status = "palette-clouds"
			else
				status = "palette-wet-asphalt"

		status


PropertyController.$inject = ['$scope','$routeParams','$location','ApiFactory','$rootScope','$uibModal', 'DocumentService', 'CacheFactory']

angular
	.module('CCBApp')
	.controller "PropertyController", PropertyController

