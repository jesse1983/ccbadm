angular.module('CCBApp').directive('inputGroup', [
  '$document', function($document) {
    return {
      restrict: 'C',
      link: function(scope, elem, attr, ctrl) {
        elem.find("input").bind('focus', function(e) {
          return $(this).closest('.input-group, .form-group').addClass('focus');
        });
        return elem.find("input").bind('blur', function(e) {
          return $(this).closest('.input-group, .form-group').removeClass('focus');
        });
      }
    };
  }
]);

angular.module('CCBApp').directive('dotdotdot', [
  '$window', function($window) {
    return {
      restrict: 'C',
      link: function(scope, elem, attr, ctrl) {
        var dottlize;
        dottlize = function() {
          if (elem.height() > 25) {
            return elem.dotdotdot({
              height: 25,
              watch: true
            });
          }
        };
        dottlize();
        return angular.element($window).bind('resize', function() {
          return dottlize();
        });
      }
    };
  }
]);
