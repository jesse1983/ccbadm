class ProfileService
	constructor: (@q, @CacheFactory, @ApiFactory)->
		true
	# find: (id)->
	all: (search = {})->
		deferred = @q.defer()

		@ApiFactory.Profile().query search, (json) =>
			deferred.resolve json
		,(error)=>
			deferred.reject error
		return deferred.promise

	update: (profile)->
		@ApiFactory.Profile().update({ id: profile.id }, profile)



ProfileService.$inject = ['$q', 'CacheFactory', 'ApiFactory']

angular
	.module 'CCBApp'
	.service 'ProfileService', ProfileService