class DocumentController
	constructor: (
		$scope,
		$rootScope,
		$uibModalInstance,
		prompt,
		Upload,
		CONSTANTS,
		current_document,
		statuses,
		ApiFactory,
		DocumentService
	)->
		@scope = $scope
		@rootScope = $rootScope
		@uibModalInstance = $uibModalInstance
		@prompt = prompt
		@NgUpload = Upload
		@CONSTANTS = CONSTANTS
		@document = current_document
		@statuses = statuses
		@ApiFactory = ApiFactory
		@DocumentService = DocumentService
		instance = new ApiFactory.Comment()
		@comment = new instance()

		@scope.$watch ()=>
			@unformatted
		, @SetExpiresAt

	Can: (action, resource)->
		console.log action, resource, @rootScope.can(action, resource)
		@rootScope.can action, resource

	GetExpiresAt: ->
		try
			date = new Date(@document.expires_at)
			date = moment(date).format("DD/MM/YYYY")
		catch e
			console.warn "Not possible convert #{date}"
		return date

	SetExpiresAt: (unformatted)=>
		if unformatted?
			@document.expires_at = moment(unformatted, "DD/MM/YYYY").format()
		return

	ModalCancel: ->
		@uibModalInstance.dismiss('cancel')


	isAutoStatus: (doc)->
		ret = false
		s = _.where @statuses, {url: doc.status}
		if s[0]
			if ret = s[0].meta
				ret = s[0].meta.auto?
		return ret

	GetStatus: (doc)->
		s = _.where @statuses, {url: doc.status}
		return s[0]

	AddComment: (comment,doc)->
		@loading_comment = true
		comment.user = @rootScope.login
		comment.commentable_id = doc.id
		comment.commentable_type = "Document"
		comment.$save().then (json)=>
			doc.comments = [] unless doc.comments
			doc.comments.push json.data
			doc.comments_count++
			@loading_comment = false

	DeleteComment: (comment,doc)->
		instance = new @ApiFactory.Comment()
		instance.delete {id: comment.id}, then =>
			index = doc.comments.indexOf(comment)
			doc.comments.splice(index,1)
			doc.comments_count--

	Upload: (files)->
		upload_errors = []
		if files? and files.length
			for file,i in files
				@NgUpload.upload
					url: "#{@CONSTANTS.API_URL}/api/attachments/",
					fields:
						'document_id': @document.id
					fileFormDataName: "attachment"
					file: file
					withCredentials: true
					headers:
						Authorization: @rootScope.login.token
				.progress (evt)=>
					percent = parseInt(100.0 * evt.loaded / evt.total)
					@upl = {}
					if percent < 100.0
						@upl.percent = percent + "%"
					else
						@upl.percent = "Tranferindo..."

				.success (json, status, headers, config)=>
					@upl = null
					@document.attachments = [] unless @document.attachments
					@document.attachments_count++
					if @document.status_id not in ["/api/statuses/DOC_EXPIRED"]
						@document.status = '/api/statuses/DOC_UPLOADED'
						@document.status_id = 'DOC_UPLOADED'
					@document.attachments.map (i) -> i.current = false
					json.data.current = true
					@document.attachments.push json.data
	ValidateUpload: (files)->
		console.log files
		true

	DestroyAttach: (attachment)->
		@prompt
			title: 'Remover anexo'
			message: "Deseja realmente remover o anexo?"
		.then ()=>
			@loading = {destroyAttach: true}
			att = @ApiFactory.Attachment().get({ id: attachment.id })
			if att?
				att.$delete {id: attachment.id}, ()=>
					@loading = null
					index = @document.attachments.indexOf(attachment)
					@document.attachments.splice(index, 1)
					@document.attachments_count--
					if @document.attachments.length > 0
						@document.attachments[0].current = true
					else
						if @document.status not in ["/api/statuses/DOC_EXPIRED"]
							@document.status = '/api/statuses/DOC_AVAILABLE'
							@document.status_id = 'DOC_AVAILABLE'


	GetBackRequest: (request)=>
		request.returned_at = moment().format()
		request.is_active = false
		instance = new @ApiFactory.Request()
		instance.update({id: request.id}, request)
		@document

	NavAttach: (act)->
		c = _.where(@document.attachments, {current: true})[0]
		c.current = false
		index = @document.attachments.indexOf(c)
		if act == 'next'
			if index == @document.attachments.length - 1
				@document.attachments[0].current = true
			else
				@document.attachments[index + 1].current = true
		else
			if index == 0
				@document.attachments[@document.attachments.length - 1].current = true
			else
				@document.attachments[index - 1].current = true
		return

	SetCurrentAttach: (doc)->
		if doc.attachments
			if doc.attachments.length > 0
				doc.attachments[0].current = true
		true

	RemoveDocument: (doc)->
		@document.status = '/api/statuses/DOC_NONE'
		@document.status_id = 'DOC_NONE'
		for attachment in @document.attachments
			@DestroyAttach(attachment)


	SaveDocument: (doc)->
		@saving = true
		doc.expand = 'document_type'
		doc.$update (json)=>
			@saving = false
			@DocumentService.recreateGroup doc.data
			@ModalCancel()


angular
	.module 'CCBApp'
	.controller 'DocumentController', DocumentController
