var SkillService;

SkillService = (function() {
  function SkillService(q, CacheFactory, ApiFactory) {
    this.q = q;
    this.CacheFactory = CacheFactory;
    this.ApiFactory = ApiFactory;
    true;
  }

  SkillService.prototype.all = function(search) {
    var deferred;
    if (search == null) {
      search = {};
    }
    deferred = this.q.defer();
    this.ApiFactory.Skill().query(search, (function(_this) {
      return function(json) {
        return deferred.resolve(json);
      };
    })(this), (function(_this) {
      return function(error) {
        return deferred.reject(error);
      };
    })(this));
    return deferred.promise;
  };

  return SkillService;

})();

SkillService.$inject = ['$q', 'CacheFactory', 'ApiFactory'];

angular.module('CCBApp').service('SkillService', SkillService);
