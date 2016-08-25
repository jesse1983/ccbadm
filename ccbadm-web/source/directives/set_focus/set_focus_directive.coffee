angular.module('CCBApp').directive 'setFocus', ['$document','$timeout',($document,$timeout) ->
    restrict: 'A'
    scope:
        setFocus: "="
    link: (scope, elem, attr, ctrl) ->
        scope.$watch "setFocus", (n,o)->
            if n?
                $timeout ()->
                  elem.focus()
                ,500
        return true

]
