var ProfilesController;

ProfilesController = (function() {
  function ProfilesController(ProfileService, SkillService) {
    ProfileService.all().then((function(_this) {
      return function(profiles) {
        return SkillService.all().then(function(skills) {
          _this.skills = _.sortBy(skills.data, 'model_pt_br');
          _this.skill_names = _this.getSkills(_this.skills);
          return _this.profiles = profiles.data;
        });
      };
    })(this));
  }

  ProfilesController.prototype.getSkills = function(skills) {
    var compact, map;
    map = skills.map(function(s) {
      return s.model_pt_br;
    });
    compact = _.uniq(map);
    return compact;
  };

  return ProfilesController;

})();

ProfilesController.$inject = ['ProfileService', 'SkillService'];

angular.module('CCBApp').component('profilesController', {
  templateUrl: 'controllers/profiles/profiles_view.html',
  controller: ProfilesController,
  controllerAs: 'vm'
});
