var ProfilesController;

ProfilesController = (function() {
  function ProfilesController(q, $rootScope, ProfileService, SkillService) {
    this.q = q;
    this.ProfileService = ProfileService;
    this.ProfileService.all().then((function(_this) {
      return function(profiles) {
        return SkillService.all().then(function(skills) {
          _this.skills = _.sortBy(skills.data, 'model_pt_br');
          _this.skill_names = _this.getSkills(_this.skills);
          _this.profiles = profiles.data;
          return _this.history = angular.copy(_this.profiles);
        });
      };
    })(this));
    $rootScope.nav = {
      current: {
        title: "Perfis"
      }
    };
  }

  ProfilesController.prototype.getSkills = function(skills) {
    var compact, map;
    map = skills.map(function(s) {
      return s.model_pt_br;
    });
    compact = _.uniq(map);
    return compact;
  };

  ProfilesController.prototype.mappedSkills = function(skills, current) {
    return skills.filter(function(s) {
      return s.model_pt_br === current;
    });
  };

  ProfilesController.prototype.classSkill = function(skills, current) {
    var c, s;
    s = this.mappedSkills(skills, current);
    c = "default";
    if (s[0]) {
      switch (s[0].name) {
        case 'manage':
          c = 'success';
          break;
        case 'show':
          c = 'inverse';
      }
    }
    return c;
  };

  ProfilesController.prototype.labelSkill = function(skills, current) {
    var c, s;
    s = this.mappedSkills(skills, current);
    c = "Nenhum";
    if (s[0]) {
      c = s[0].name_pt_br;
    }
    return c;
  };

  ProfilesController.prototype.removeSkill = function(profile, skill) {
    var i, index, len, ref, x;
    ref = profile.skills;
    for (i = 0, len = ref.length; i < len; i++) {
      x = ref[i];
      if (x) {
        if (x.model_pt_br === skill) {
          index = profile.skills.indexOf(x);
          profile.skills.splice(index, 1);
          true;
        }
      }
    }
  };

  ProfilesController.prototype.setSkill = function(profile, skill, action) {
    var skillObj;
    skillObj = this.skills.filter((function(_this) {
      return function(s) {
        return s.model_pt_br === skill && s.name === action;
      };
    })(this))[0];
    if (!action) {
      this.removeSkill(profile, skill);
    } else {
      if (profile.skills.filter((function(_this) {
        return function(f) {
          return f.model_pt_br === skill;
        };
      })(this)).length > 0) {
        this.removeSkill(profile, skill);
      }
      profile.skills.push(skillObj);
    }
    return true;
  };

  ProfilesController.prototype.changed = function() {
    var current, history;
    history = this.history.map(function(m) {
      return m.skills.sort();
    });
    current = this.profiles.map(function(m) {
      return m.skills.sort();
    });
    return !angular.equals(history, current);
  };

  ProfilesController.prototype.compare = function(profile) {
    var history;
    history = this.history.filter(function(f) {
      return f.id === profile.id;
    })[0];
    return angular.equals(history.skills.sort(), profile.skills.sort());
  };

  ProfilesController.prototype.reset = function() {
    return this.profiles = angular.copy(this.history);
  };

  ProfilesController.prototype.save = function() {
    var deferred, i, len, profile, profiles, promises;
    this.loading = true;
    deferred = this.q.defer();
    promises = [];
    profiles = this.profiles.filter((function(_this) {
      return function(m) {
        return !_this.compare(m);
      };
    })(this));
    for (i = 0, len = profiles.length; i < len; i++) {
      profile = profiles[i];
      profile.skill_ids = profile.skills.map(function(s) {
        return s.id;
      }).join(',');
      promises.push(this.ProfileService.update(profile));
    }
    this.q.all(promises).then((function(_this) {
      return function(result) {
        _this.loading = false;
        return _this.history = angular.copy(_this.profiles);
      };
    })(this));
    return deferred.promise;
  };

  return ProfilesController;

})();

ProfilesController.$inject = ['$q', '$rootScope', 'ProfileService', 'SkillService'];

angular.module('CCBApp').component('profilesController', {
  templateUrl: 'controllers/profiles/profiles_view.html',
  controller: ProfilesController,
  controllerAs: 'vm'
});
