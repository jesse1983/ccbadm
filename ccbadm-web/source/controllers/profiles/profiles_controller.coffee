class ProfilesController
	constructor: (ProfileService, SkillService) ->
		ProfileService.all().then (profiles) =>
			SkillService.all().then (skills) =>
				@skills = _.sortBy skills.data, 'model_pt_br'
				@skill_names = @getSkills(@skills)
				@profiles = profiles.data

	getSkills: (skills) ->
		map = skills.map (s) -> s.model_pt_br
		compact = _.uniq map
		compact


ProfilesController.$inject = ['ProfileService', 'SkillService']

angular
	.module('CCBApp')
	.component 'profilesController', {
		templateUrl: 'controllers/profiles/profiles_view.html'
		controller: ProfilesController
		controllerAs: 'vm'
	}