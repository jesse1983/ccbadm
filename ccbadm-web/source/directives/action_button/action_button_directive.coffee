angular.module('CCBApp').directive 'actionButton', ['$document',($document) ->
  restrict: 'A'
  scope:
    actionButton: "="
  link: (scope, elem, attr, ctrl) ->
    default_text = elem.html()
    scope.$watch "actionButton", (n,o)->
      if n?
        if n == true
          elem.html("<i class='fa fa-spinner fa-spin'></i>")
          elem.attr({disabled: true})
      else
        elem.html(default_text)
        elem.removeAttr("disabled")

]
