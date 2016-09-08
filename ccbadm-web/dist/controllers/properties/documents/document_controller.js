var DocumentController,
  bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

DocumentController = (function() {
  function DocumentController($scope, $rootScope, $uibModalInstance, prompt, Upload, CONSTANTS, current_document, statuses, ApiFactory, DocumentService) {
    this.GetBackRequest = bind(this.GetBackRequest, this);
    this.SetExpiresAt = bind(this.SetExpiresAt, this);
    var instance;
    this.scope = $scope;
    this.rootScope = $rootScope;
    this.uibModalInstance = $uibModalInstance;
    this.prompt = prompt;
    this.NgUpload = Upload;
    this.CONSTANTS = CONSTANTS;
    this.document = current_document;
    this.statuses = statuses;
    this.ApiFactory = ApiFactory;
    this.DocumentService = DocumentService;
    instance = new ApiFactory.Comment();
    this.comment = new instance();
    $scope.$watch((function(_this) {
      return function() {
        return _this.unformatted;
      };
    })(this), this.SetExpiresAt);
  }

  DocumentController.prototype.GetExpiresAt = function() {
    var date, e, error;
    try {
      date = new Date(this.document.expires_at);
      date = moment(date).format("DD/MM/YYYY");
    } catch (error) {
      e = error;
      console.warn("Not possible convert " + date);
    }
    return date;
  };

  DocumentController.prototype.SetExpiresAt = function(unformatted) {
    if (unformatted != null) {
      this.document.expires_at = moment(unformatted, "DD/MM/YYYY").format();
    }
  };

  DocumentController.prototype.ModalCancel = function() {
    return this.uibModalInstance.dismiss('cancel');
  };

  DocumentController.prototype.isAutoStatus = function(doc) {
    var ret, s;
    ret = false;
    s = _.where(this.statuses, {
      url: doc.status
    });
    if (s[0]) {
      if (ret = s[0].meta) {
        ret = s[0].meta.auto != null;
      }
    }
    return ret;
  };

  DocumentController.prototype.GetStatus = function(doc) {
    var s;
    s = _.where(this.statuses, {
      url: doc.status
    });
    return s[0];
  };

  DocumentController.prototype.AddComment = function(comment, doc) {
    this.loading_comment = true;
    comment.user = this.rootScope.login;
    comment.commentable_id = doc.id;
    comment.commentable_type = "Document";
    return comment.$save().then((function(_this) {
      return function(json) {
        if (!doc.comments) {
          doc.comments = [];
        }
        doc.comments.push(json.data);
        doc.comments_count++;
        return _this.loading_comment = false;
      };
    })(this));
  };

  DocumentController.prototype.DeleteComment = function(comment, doc) {
    var instance;
    instance = new this.ApiFactory.Comment();
    return instance["delete"]({
      id: comment.id
    }, (function(_this) {
      return function() {
        var index;
        index = doc.comments.indexOf(comment);
        doc.comments.splice(index, 1);
        return doc.comments_count--;
      };
    })(this));
  };

  DocumentController.prototype.Upload = function(files) {
    var file, i, j, len, results;
    if ((files != null) && files.length) {
      results = [];
      for (i = j = 0, len = files.length; j < len; i = ++j) {
        file = files[i];
        results.push(this.NgUpload.upload({
          url: this.CONSTANTS.API_URL + "/api/attachments/",
          fields: {
            'document_id': this.document.id
          },
          fileFormDataName: "attachment",
          file: file,
          withCredentials: true,
          headers: {
            Authorization: this.rootScope.login.token
          }
        }).progress((function(_this) {
          return function(evt) {
            var percent;
            percent = parseInt(100.0 * evt.loaded / evt.total);
            _this.upl = {};
            if (percent < 100.0) {
              return _this.upl.percent = percent + "%";
            } else {
              return _this.upl.percent = "Tranferindo...";
            }
          };
        })(this)).success((function(_this) {
          return function(json, status, headers, config) {
            var ref;
            _this.upl = null;
            _this.document.attachments = [];
            _this.document.attachments_count++;
            if ((ref = _this.document.status_id) !== "/api/statuses/DOC_EXPIRED") {
              _this.document.status = '/api/statuses/DOC_UPLOADED';
              _this.document.status_id = 'DOC_UPLOADED';
            }
            return _this.document.attachments.push(json.data);
          };
        })(this)));
      }
      return results;
    }
  };

  DocumentController.prototype.DestroyAttach = function(attachment) {
    return this.prompt({
      title: 'Remover anexo',
      message: "Deseja realmente remover o anexo?"
    }).then((function(_this) {
      return function() {
        var att;
        _this.loading = {
          destroyAttach: true
        };
        att = _this.ApiFactory.Attachment().get({
          id: attachment.id
        });
        if (att != null) {
          return att.$delete({
            id: attachment.id
          }, function() {
            var ref;
            _this.loading = null;
            _this.document.attachments = [];
            _this.document.attachments_count = 0;
            if ((ref = _this.document.status) !== "/api/statuses/DOC_EXPIRED") {
              _this.document.status = '/api/statuses/DOC_AVAILABLE';
              return _this.document.status_id = 'DOC_AVAILABLE';
            }
          });
        }
      };
    })(this));
  };

  DocumentController.prototype.GetBackRequest = function(request) {
    var instance;
    request.returned_at = moment().format();
    request.is_active = false;
    instance = new this.ApiFactory.Request();
    instance.update({
      id: request.id
    }, request);
    return this.document;
  };

  DocumentController.prototype.SaveDocument = function(doc) {
    this.saving = true;
    doc.expand = 'document_type';
    return doc.$update((function(_this) {
      return function(json) {
        _this.saving = false;
        _this.DocumentService.recreateGroup(doc.data);
        return _this.ModalCancel();
      };
    })(this));
  };

  return DocumentController;

})();

angular.module('CCBApp').controller('DocumentController', DocumentController);
