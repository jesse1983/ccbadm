ccbApp = angular.module("ccbApp", ["ngResource","ui.bootstrap"])

angular.module('CCBApp').controller "PatrimonyCtrl", ['$scope','$http','$filter',($scope,$http,$filter) ->
  $http.get("/api/patrimony/project").success (tags, status, headers, config) ->
    $scope.tags = []

    $http.get("/api/patrimony/cards").success (cards, status, headers, config) ->
      $scope.cards = cards
      $scope.total = cards.length
      $scope.status = []
      $scope.search = new Object()
      $scope.search.status = ''
      i = 0
      while i < tags.length
        object =
           name: tags[i]
           cards: []
        c = 0
        while c < cards.length
          ct = 0
          # Add Tags
          while ct < cards[c].tags.length
            if cards[c].tags[ct] is tags[i]
              object.cards.push 
                church: cards[c].name
                status: cards[c].column
            ct++
          # Add Statusses
          $scope.status.push(cards[c].column) if cards[c].column not in $scope.status            
          c++
        object.percent = parseInt object.cards.length * 100 / $scope.total 
        $scope.tags.push object
        i++
    return

  $scope.openDetails = (tag) ->
    $scope.doc = tag

  $scope.getPercent = (tag) ->
    Math.round($filter('filter')(tag.cards, $scope.search).length * 100 / $filter('filter')($scope.cards, {column: $scope.search.status}).length)

  $scope.cardsMissing = (tag) ->
    findme = "findme"
    a = []
    if tag?
      if $scope.cards?
        for cardindex in $scope.cards
          unless tag.name in cardindex.tags
            a.push cardindex
    a

]