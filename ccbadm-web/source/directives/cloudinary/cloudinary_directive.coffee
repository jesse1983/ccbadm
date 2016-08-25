angular.module('CCBApp').directive 'cloudinary', ['$document',($document) ->
    restrict: 'A'
    scope:
        clSrc: "@"
        cloudinary: "@"
    link: (scope, elem, attr, ctrl) ->
        scope.$watch "clSrc", (n,o) ->
            if n?
                if n.length > 0
                    paths = scope.clSrc.split("/")
                    end_path = paths[paths.length - 2] + '/' + paths[paths.length - 1]
                    start_path = scope.clSrc.replace(end_path,"")
                    image = new Image()
                    final = start_path + scope.cloudinary + "/" + end_path
                    final = final.replace(".pdf",".jpg")
                    image.onload = ()->
                        elem.attr "src", final
                    image.src = final

                    

]