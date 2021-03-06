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
    this.scope.$watch((function(_this) {
      return function() {
        return _this.unformatted;
      };
    })(this), this.SetExpiresAt);
  }

  DocumentController.prototype.Can = function(action, resource) {
    console.log(action, resource, this.rootScope.can(action, resource));
    return this.rootScope.can(action, resource);
  };

  DocumentController.prototype.GetExpiresAt = function() {
    var date, e;
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
    var file, i, j, len, results, upload_errors;
    upload_errors = [];
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
            if (!_this.document.attachments) {
              _this.document.attachments = [];
            }
            _this.document.attachments_count++;
            if ((ref = _this.document.status_id) !== "/api/statuses/DOC_EXPIRED") {
              _this.document.status = '/api/statuses/DOC_UPLOADED';
              _this.document.status_id = 'DOC_UPLOADED';
            }
            _this.document.attachments.map(function(i) {
              return i.current = false;
            });
            json.data.current = true;
            return _this.document.attachments.push(json.data);
          };
        })(this)));
      }
      return results;
    }
  };

  DocumentController.prototype.ValidateUpload = function(files) {
    console.log(files);
    return true;
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
            var index, ref;
            _this.loading = null;
            index = _this.document.attachments.indexOf(attachment);
            _this.document.attachments.splice(index, 1);
            _this.document.attachments_count--;
            if (_this.document.attachments.length > 0) {
              return _this.document.attachments[0].current = true;
            } else {
              if ((ref = _this.document.status) !== "/api/statuses/DOC_EXPIRED") {
                _this.document.status = '/api/statuses/DOC_AVAILABLE';
                return _this.document.status_id = 'DOC_AVAILABLE';
              }
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

  DocumentController.prototype.NavAttach = function(act) {
    var c, index;
    c = _.where(this.document.attachments, {
      current: true
    })[0];
    c.current = false;
    index = this.document.attachments.indexOf(c);
    if (act === 'next') {
      if (index === this.document.attachments.length - 1) {
        this.document.attachments[0].current = true;
      } else {
        this.document.attachments[index + 1].current = true;
      }
    } else {
      if (index === 0) {
        this.document.attachments[this.document.attachments.length - 1].current = true;
      } else {
        this.document.attachments[index - 1].current = true;
      }
    }
  };

  DocumentController.prototype.SetCurrentAttach = function(doc) {
    if (doc.attachments) {
      if (doc.attachments.length > 0) {
        doc.attachments[0].current = true;
      }
    }
    return true;
  };

  DocumentController.prototype.RemoveDocument = function(doc) {
    var attachment, j, len, ref, results;
    this.document.status = '/api/statuses/DOC_NONE';
    this.document.status_id = 'DOC_NONE';
    ref = this.document.attachments;
    results = [];
    for (j = 0, len = ref.length; j < len; j++) {
      attachment = ref[j];
      results.push(this.DestroyAttach(attachment));
    }
    return results;
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
