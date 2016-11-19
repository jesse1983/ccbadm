class DropdownLink
	constructor: (scope, element, attr)->
		scope.click = -> 
			angular.element(element).toggleClass('open')
			return
		return

angular
	.module "CCBApp"
	.directive 'dropdown', -> 
		link: DropdownLink
		transclude: true
		restrict: 'E'
		replace: true
		template: "<div class='btn-group' ng-click='click()' ng-transclude></div>"
		

