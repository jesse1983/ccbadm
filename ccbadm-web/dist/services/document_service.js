var DocumentService;

DocumentService = (function() {
  function DocumentService(q, CacheFactory, ApiFactory) {
    this.q = q;
    this.CacheFactory = CacheFactory;
    this.ApiFactory = ApiFactory;
    true;
  }

  DocumentService.prototype.all = function(search) {
    var deferred;
    if (search == null) {
      search = {};
    }
    deferred = this.q.defer();
    search.limit = search.limit || 50;
    self.expand = self.expand || "document_type";
    this.ApiFactory.Document().query(search, (function(_this) {
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

  DocumentService.prototype.groupByStatus = function(statuses, search) {
    var deferred;
    deferred = this.q.defer();
    search.limit = search.limit || 50;
    search.expand = search.expand || "document_type";
    if (this.CacheFactory.get('DocumentService::groupByStatus')) {
      deferred.resolve(this.CacheFactory.get('DocumentService::groupByStatus'));
    } else {
      this.ApiFactory.Document().query(search, (function(_this) {
        return function(json) {
          var i, s;
          for (i in json.data) {
            if (json.data[i].expires_at !== null) {
              json.data[i].expires_at = new Date(json.data[i].expires_at);
              if (json.data[i].expires_at < new Date()) {
                json.data[i].expired = true;
              }
            }
            for (s in statuses) {
              if (statuses[s].url === json.data[i].status) {
                if (statuses[s].documents == null) {
                  statuses[s].documents = [];
                }
                statuses[s].documents.push(json.data[i]);
              }
            }
          }
          _this.CacheFactory.set('DocumentService::groupByStatus', statuses);
          return deferred.resolve(statuses);
        };
      })(this));
    }
    return deferred.promise;
  };

  DocumentService.prototype.recreateGroup = function(doc) {
    var d, i, index, j, k, l, len, len1, len2, n, ref, status, statuses;
    statuses = this.CacheFactory.get('DocumentService::groupByStatus');
    if (statuses) {
      for (n = j = 0, len = statuses.length; j < len; n = ++j) {
        status = statuses[n];
        if (status.documents) {
          ref = status.documents;
          for (i = k = 0, len1 = ref.length; k < len1; i = ++k) {
            d = ref[i];
            if (d) {
              if (d.id === doc.id) {
                index = status.documents.indexOf(d);
                status.documents.splice(index, 1);
              }
            }
          }
        }
      }
      for (n = l = 0, len2 = statuses.length; l < len2; n = ++l) {
        status = statuses[n];
        if (!status.documents) {
          status.documents = [];
        }
        if (doc.status === status.url) {
          status.documents.push(doc);
        }
      }
      this.CacheFactory.set('DocumentService::groupByStatus', statuses);
    }
  };

  return DocumentService;

})();

DocumentService.$inject = ['$q', 'CacheFactory', 'ApiFactory'];

angular.module('CCBApp').service('DocumentService', DocumentService);
