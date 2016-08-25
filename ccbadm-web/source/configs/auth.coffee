angular
	.module("CCBApp")
	.factory "Auth", ['$cookieStore',($cookieStore) ->
		auth = null
		return {
			set: (value)-> auth = value
			get: -> auth
		}
	]
