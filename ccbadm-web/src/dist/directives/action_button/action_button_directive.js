angular.module('CCBApp').directive('actionButton', [
  '$document', function($document) {
    return {
      restrict: 'A',
      scope: {
        actionButton: "="
      },
      link: function(scope, elem, attr, ctrl) {
        var default_text;
        default_text = elem.html();
        return scope.$watch("actionButton", function(n, o) {
          if (n != null) {
            if (n === true) {
              elem.html("<i class='fa fa-spinner fa-spin'></i>");
              return elem.attr({
                disabled: true
              });
            }
          } else {
            elem.html(default_text);
            return elem.removeAttr("disabled");
          }
        });
      }
    };
  }
]);
