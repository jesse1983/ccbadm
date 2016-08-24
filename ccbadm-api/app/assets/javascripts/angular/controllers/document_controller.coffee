angular.module('CCBApp').controller "DocumentController", ['$scope','$routeParams','$location','Upload','ApiFactory','$rootScope','prompt',($scope,$routeParams,$location,Upload,ApiFactory,$rootScope,prompt) ->
	ApiFactory.Property.get {id: $routeParams.property_id,expand: "church"}, (json) ->
		$scope.property = json

		$scope.document = ApiFactory.Document.get(id:$routeParams.id, expand: "attachments,document_type")


		$scope.$watch "document.is_active", (n,o)->
			if n?
				$rootScope.nav =
						current:
							title: $scope.document.document_type.code
						back:
							title: $scope.property.title
							url: "properties/#{$scope.property.id}"
				$scope.document.is_possible = true if n

	$scope.save = (document) ->
		if $scope.document.id?
			$scope.document.$update(successSave())
		else
			$scope.document.$save(successSave())
	successSave = ->
		$location.path "/properties/#{$scope.property.id}"
	$scope.attachName = (attachment) ->
		if attachment.attachment
			a = attachment.attachment.split('/')
			return a[a.length - 1]

	$scope.nextDocument = () ->
		if $scope.document.document_type.id < 17
			$location.path "/properties/4/documents/#{$scope.document.id + 1}"
	$scope.prevDocument = () ->
		if $scope.document.document_type.id > 1
			$location.path "/properties/4/documents/#{$scope.document.id - 1}"
	$scope.hasNavDocument = (nav) ->
		false

	$scope.$watch 'files', (n,o)->
		$scope.upload $scope.files
	$scope.upload = (files)->
		if $scope.files? and $scope.files.length
			for file,i in files
				Upload.upload
					url: 'api/attachments/',
					fields:
						'document_id': $scope.document.id
					fileFormDataName: "attachment"
					file: file
					withCredentials: true
				.progress (evt)->
					percent = parseInt(100.0 * evt.loaded / evt.total)
					$scope.upl = {}
					if percent < 100.0
						$scope.upl.percent = percent + "%"
					else
						$scope.upl.percent = "Tranferindo..."

				.success (json, status, headers, config)->
					$scope.upl = null
					$scope.document.attachments = []
					$scope.document.attachments.push json.data
	$scope.destroyAttach = (attachment)->
		prompt
			title: 'Remover anexo'
			message: "Deseja realmente remover o anexo?"
		.then ()->
			$scope.loading = {destroyAttach: true}
			att = ApiFactory.Attachment.get({ id: attachment.id })
			if att?
				att.$delete {id: attachment.id}, ()->
					$scope.loading = null
					$scope.document.attachments = []





]
