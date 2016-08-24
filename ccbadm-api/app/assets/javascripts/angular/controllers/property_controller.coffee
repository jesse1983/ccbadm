angular.module('CCBApp').controller "PropertyController", ['$scope','$routeParams','$location','ApiFactory','$rootScope',($scope,$routeParams,$location,ApiFactory,$rootScope) ->
	$scope.query = $routeParams
	$scope.property = null
	$scope.document_types = null
	$scope.documents = null
	$scope.document_type = null

	# $scope.properties = {}

	ApiFactory.Property.get {id: $routeParams.id,expand: "church"}, (json) ->
		$scope.property = json
		$rootScope.nav =
			current:
				title: $scope.property.title
			back:
				title: "Imóveis"
				url: "properties"

		ApiFactory.Document.query {limit: 50,documentable_id_eq:$scope.property.id,documentable_type_eq: "Property",expand:"document_type"}, (json) ->
			for i of json.data
				if json.data[i].expires_at != null
					json.data[i].expires_at = new Date(json.data[i].expires_at) 
					json.data[i].expired = true if json.data[i].expires_at < new Date()
			$scope.documents = json.data


	$scope.getDocument = (document_type) ->
		d = _.where $scope.documents, {document_type: document_type.title}
		d[0] if d.length > 0
	$scope.gotoDocument = (property,document)->
		$location.path "/properties/#{property.id}/documents/#{document.id}"
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


]
