var ccbApp,
  indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

ccbApp = angular.module("ccbApp", ["ngResource", "ui.bootstrap"]);

angular.module('CCBApp').controller("PatrimonyCtrl", [
  '$scope', '$http', '$filter', function($scope, $http, $filter) {
    $http.get("/api/patrimony/project").success(function(tags, status, headers, config) {
      $scope.tags = [];
      $http.get("/api/patrimony/cards").success(function(cards, status, headers, config) {
        var c, ct, i, object, ref, results;
        $scope.cards = cards;
        $scope.total = cards.length;
        $scope.status = [];
        $scope.search = new Object();
        $scope.search.status = '';
        i = 0;
        results = [];
        while (i < tags.length) {
          object = {
            name: tags[i],
            cards: []
          };
          c = 0;
          while (c < cards.length) {
            ct = 0;
            while (ct < cards[c].tags.length) {
              if (cards[c].tags[ct] === tags[i]) {
                object.cards.push({
                  church: cards[c].name,
                  status: cards[c].column
                });
              }
              ct++;
            }
            if (ref = cards[c].column, indexOf.call($scope.status, ref) < 0) {
              $scope.status.push(cards[c].column);
            }
            c++;
          }
          object.percent = parseInt(object.cards.length * 100 / $scope.total);
          $scope.tags.push(object);
          results.push(i++);
        }
        return results;
      });
    });
    $scope.openDetails = function(tag) {
      return $scope.doc = tag;
    };
    $scope.getPercent = function(tag) {
      return Math.round($filter('filter')(tag.cards, $scope.search).length * 100 / $filter('filter')($scope.cards, {
        column: $scope.search.status
      }).length);
    };
    return $scope.cardsMissing = function(tag) {
      var a, cardindex, findme, j, len, ref, ref1;
      findme = "findme";
      a = [];
      if (tag != null) {
        if ($scope.cards != null) {
          ref = $scope.cards;
          for (j = 0, len = ref.length; j < len; j++) {
            cardindex = ref[j];
            if (ref1 = tag.name, indexOf.call(cardindex.tags, ref1) < 0) {
              a.push(cardindex);
            }
          }
        }
      }
      return a;
    };
  }
]);
