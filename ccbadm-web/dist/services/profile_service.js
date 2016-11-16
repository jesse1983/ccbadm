var ProfileService;

ProfileService = (function() {
  function ProfileService(q, CacheFactory, ApiFactory) {
    this.q = q;
    this.CacheFactory = CacheFactory;
    this.ApiFactory = ApiFactory;
    true;
  }

  ProfileService.prototype.all = function(search) {
    var deferred;
    if (search == null) {
      search = {};
    }
    deferred = this.q.defer();
    this.ApiFactory.Profile().query(search, (function(_this) {
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

  return ProfileService;

})();

ProfileService.$inject = ['$q', 'CacheFactory', 'ApiFactory'];

angular.module('CCBApp').service('ProfileService', ProfileService);
