angular.module('CCBApp').directive 'inputGroup', ['$document',($document) ->
    restrict: 'C'
    link: (scope, elem, attr, ctrl) ->
      elem.find("input").bind 'focus', (e) ->
        $(this).closest('.input-group, .form-group').addClass('focus')
      elem.find("input").bind 'blur', (e) ->
        $(this).closest('.input-group, .form-group').removeClass('focus')        
]
angular.module('CCBApp').directive 'dotdotdot', ['$window', ($window) ->
    restrict: 'C'
    link: (scope, elem, attr, ctrl) ->
        dottlize = () ->
            if elem.height() > 25
                elem.dotdotdot({height: 25, watch: true})
        dottlize()
        angular.element($window).bind 'resize', () ->
            dottlize()
]