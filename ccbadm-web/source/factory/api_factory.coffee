angular
	.module("CCBApp")
	.factory "ApiFactory", ['$resource','CONSTANTS', '$cookieStore',($resource,CONSTANTS) ->
		source = "#{CONSTANTS.API_URL}/api"
		headers =
			Authorization: null
		interceptor =
			responseError: (error)->
				if error.status in [403,401,404]
					window.location.href = "/#/logout"
		config = (cache) ->
			return {
				query:
					headers: headers
					interceptor: interceptor
					method:'GET'
					isArray:false
					cache: cache
				get:
					headers: headers
					interceptor: interceptor
					transformResponse: (response,header) ->
						angular.fromJson(response).data
				save:
					headers: headers
					interceptor: interceptor
					method:'POST'
				create:
					headers: headers
					interceptor: interceptor
					method:'POST'
				update:
					headers: headers
					interceptor: interceptor
					method:'PATCH'
				delete:
					headers: headers
					interceptor: interceptor
					method:'DELETE'
					params: { id: "@id" }
					method: "DELETE"
					isArray: false
			}
		methods =
			Set: (value)->
				headers.Authorization = value
			Attachment: -> $resource("#{source}/attachments/:id", {id: '@id'}, config(false))
			Church: -> $resource("#{source}/churches/:id", {id: '@id'}, config(false))
			Document: -> $resource("#{source}/documents/:id", {id: '@id'}, config(false))
			DocumentType: -> $resource("#{source}/document_types/:id", {id: '@id'}, config(true))
			Login: -> $resource("#{source}/login", {}, config(false))
			Property: -> $resource("#{source}/properties/:id", {id: '@id'}, config(false))
			Profile: -> $resource("#{source}/profiles/:id", {id: '@id'}, config(true))
			Request: -> $resource("#{source}/requests/:id", {id: '@id'}, config(false))
			Status: -> $resource("#{source}/statuses/:id", {id: '@id'}, config(true))
			Comment: -> $resource("#{source}/comments/:id", {id: '@id'}, config(false))
			User: -> $resource("#{source}/users/:id", {id: '@id'}, config(false))
		return methods
	]
