class DocumentService
	constructor: (@q, @CacheFactory, @ApiFactory)->
		true
	# find: (id)->
	all: (search = {})->
		deferred = @q.defer()
		search.limit = search.limit || 50
		self.expand = self.expand || "document_type"

		@ApiFactory.Document().query search, (json) =>
			deferred.resolve json
		,(error)=>
			deferred.reject error
		return deferred.promise

	groupByStatus: (statuses, search)->
		cache_key = "DocumentService::groupByStatus(#{search.documentable_id_eq})"
		deferred = @q.defer()
		search.limit = search.limit || 50
		search.expand = search.expand || "document_type"
		if @CacheFactory.get cache_key
			deferred.resolve @CacheFactory.get(cache_key)
		else
			@ApiFactory.Document().query search, (json) =>
				for i of json.data
					if json.data[i].expires_at != null
						json.data[i].expires_at = new Date(json.data[i].expires_at)
						json.data[i].expired = true if json.data[i].expires_at < new Date()
					for s of statuses
						if statuses[s].url is json.data[i].status
							statuses[s].documents = [] unless statuses[s].documents?
							statuses[s].documents.push json.data[i]
				@CacheFactory.set(cache_key, statuses)
				deferred.resolve statuses
		return deferred.promise

	recreateGroup: (doc)->
		doc_property = doc.property.match(/(\d+)(?!.*\d)/g)[0]
		cache_key = "DocumentService::groupByStatus(#{doc_property})"
		statuses = @CacheFactory.get cache_key
		if statuses
			# Remove doc from group
			for status,n in statuses
				if status.documents
					for d,i in status.documents
						if d
							if d.id == doc.id
								index = status.documents.indexOf d
								status.documents.splice(index,1)
			# Realoc doc to group
			for status,n in statuses
				status.documents = [] unless status.documents
				if doc.status == status.url
					status.documents.push doc

			@CacheFactory.set(cache_key, statuses)
		return

DocumentService.$inject = ['$q', 'CacheFactory', 'ApiFactory']

angular
	.module 'CCBApp'
	.service 'DocumentService', DocumentService