CacheFactory = ->
	cache = {}
	return {
		get: (key)-> return cache[key] || null
		set: (key,value)-> cache[key] = value
	}

angular
	.module 'CCBApp'
	.factory 'CacheFactory', CacheFactory