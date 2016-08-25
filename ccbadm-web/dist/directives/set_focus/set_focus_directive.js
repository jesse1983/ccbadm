angular.module('CCBApp').directive('setFocus', [
  '$document', '$timeout', function($document, $timeout) {
    return {
      restrict: 'A',
      scope: {
        setFocus: "="
      },
      link: function(scope, elem, attr, ctrl) {
        scope.$watch("setFocus", function(n, o) {
          if (n != null) {
            return $timeout(function() {
              return elem.focus();
            }, 500);
          }
        });
        return true;
      }
    };
  }
]);
