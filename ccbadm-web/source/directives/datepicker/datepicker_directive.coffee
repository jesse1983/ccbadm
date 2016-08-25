angular
	.module("CCBApp")
	.directive 'ngDatepicker', [ ->
		return {
			restrict: "AC"
			scope:
				options: "=?"
			link: (scope, element, attrs)->
				scope.options = scope.options || {}
				scope.options.language = "pt-BR"
				scope.options.container = ".content"

				element.datepicker(scope.options)
		}
	]