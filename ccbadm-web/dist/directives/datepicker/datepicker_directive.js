angular.module("CCBApp").directive('ngDatepicker', [
  function() {
    return {
      restrict: "AC",
      scope: {
        options: "=?"
      },
      link: function(scope, element, attrs) {
        scope.options = scope.options || {};
        scope.options.language = "pt-BR";
        scope.options.container = ".content";
        return element.datepicker(scope.options);
      }
    };
  }
]);
