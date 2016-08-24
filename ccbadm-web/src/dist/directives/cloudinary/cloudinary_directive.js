angular.module('CCBApp').directive('cloudinary', [
  '$document', function($document) {
    return {
      restrict: 'A',
      scope: {
        clSrc: "@",
        cloudinary: "@"
      },
      link: function(scope, elem, attr, ctrl) {
        return scope.$watch("clSrc", function(n, o) {
          var end_path, final, image, paths, start_path;
          if (n != null) {
            if (n.length > 0) {
              paths = scope.clSrc.split("/");
              end_path = paths[paths.length - 2] + '/' + paths[paths.length - 1];
              start_path = scope.clSrc.replace(end_path, "");
              image = new Image();
              final = start_path + scope.cloudinary + "/" + end_path;
              final = final.replace(".pdf", ".jpg");
              image.onload = function() {
                return elem.attr("src", final);
              };
              return image.src = final;
            }
          }
        });
      }
    };
  }
]);
