class SkillService
	constructor: (@q, @CacheFactory, @ApiFactory)->
		true
	# find: (id)->
	all: (search = {})->
		deferred = @q.defer()

		@ApiFactory.Skill().query search, (json) =>
			deferred.resolve json
		,(error)=>
			deferred.reject error
		return deferred.promise


SkillService.$inject = ['$q', 'CacheFactory', 'ApiFactory']

angular
	.module 'CCBApp'
	.service 'SkillService', SkillService