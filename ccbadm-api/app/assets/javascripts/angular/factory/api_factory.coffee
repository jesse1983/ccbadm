angular.module("CCBApp").factory "ApiFactory", ['$resource',($resource) ->

	config = (cache) ->
		query:
			method:'GET'
			isArray:false
			cache: cache
		get:
			transformResponse: (response,header) ->
				angular.fromJson(response).data
			interceptor: 
				responseError: (response) ->
					if response.status in [401,403]
						window.location.href = "/#/logout"
		update:
			method:'PATCH'
		delete:
			method:'DELETE'
			params: { id: "@id" }
			method: "DELETE"
			isArray: false


	Attachment:  $resource("/api/attachments/:id", {id: '@id'}, config(true))
	Church:  $resource("/api/churches/:id", {id: '@id'}, config(true))
	Document:  $resource("/api/documents/:id", {id: '@id'}, config(false))
	DocumentType: $resource("/api/document_types/:id", {id: '@id'}, config(true))
	Login: $resource("/api/login", {}, config(false))
	Property: $resource("/api/properties/:id", {id: '@id'}, config(true))
	Profile: $resource("/api/profiles/:id", {id: '@id'}, config(true))
	User: $resource("/api/users/:id", {id: '@id'}, config(false))

]