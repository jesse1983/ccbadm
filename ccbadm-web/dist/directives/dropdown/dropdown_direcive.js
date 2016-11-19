var DropdownLink;

DropdownLink = (function() {
  function DropdownLink(scope, element, attr) {
    scope.click = function() {
      angular.element(element).toggleClass('open');
    };
    return;
  }

  return DropdownLink;

})();

angular.module("CCBApp").directive('dropdown', function() {
  return {
    link: DropdownLink,
    transclude: true,
    restrict: 'E',
    replace: true,
    template: "<div class='btn-group' ng-click='click()' ng-transclude></div>"
  };
});
