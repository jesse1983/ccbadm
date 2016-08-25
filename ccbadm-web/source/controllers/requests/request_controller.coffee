class RequestController
	constructor: (@cookieStore, @rootScope,@ApiFactory,@location,@prompt)->
		@request =
			is_active: true
		@title = "Nova retirada"
		@rootScope.nav =
			current:
				title: "Nova retirada"
			back:
				title: "Retiradas"
				url: "requests"
			button:
				label: "Salvar"
				action: () => @Save()
		@GetChurches()

	CurrentUser: ->
		current_user = @rootScope.login
		current_user

	GetChurches: ->
		@loading = "churches"
		@documents = null
		@properties = null
		@requestable_id = null
		@ApiFactory.Church().query
			limit: 100
		,(data)=>
			delete @loading
			@churches = data.data

	GetProperties: (church_id)->
		@loading = "properties"
		@documents = null
		@properties = null
		@requestable_id = null
		@ApiFactory.Property().query
			limit: 100
			church_id: church_id
		,(data)=>
			delete @loading
			@properties = data.data

	GetDocuments: (property_id)->
		@loading = "documents"
		@documents = null
		@requestable_id = null
		@ApiFactory.Document().query
			limit: 30
			documentable_id_eq: property_id
			expand: "document_type"
		,(data)=>
			delete @loading
			@documents = data.data

	Save: ->
		@submitted = true
		if @form.$valid
			@request.is_active = true
			@request.user_id = @CurrentUser().id
			@request.requestable_type = "Document"
			factory = @ApiFactory.Request()
			request_instance = new factory(@request)
			request_instance.$save =>
				@prompt
					title: 'Salvo com sucesso'
					message: 'A retirada do documento foi salva com sucesso'
					buttons: [{ label:'OK', primary: true }]
				.then =>
					@location.path "requests"
		else
			@prompt
				title: 'Informações pendentes'
				message: "Alguns informações ainda não foram preenchidas"
				buttons: [{ label:'OK', cancel: true }]

RequestController.$inject = ['$cookieStore','$rootScope','ApiFactory','$location','prompt']

angular.module("CCBApp").controller("RequestController",RequestController)