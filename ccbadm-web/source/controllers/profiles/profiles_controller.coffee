class ProfilesController
	constructor: (@q, $rootScope, @ProfileService, SkillService) ->
		@ProfileService.all().then (profiles) =>
			SkillService.all().then (skills) =>
				@skills = _.sortBy skills.data, 'model_pt_br'
				@skill_names = @getSkills(@skills)
				@profiles = profiles.data
				@history = angular.copy(@profiles)
		$rootScope.nav =
			current:
				title: "Perfis"
		# @loading = true

	getSkills: (skills) ->
		map = skills.map (s) -> s.model_pt_br
		compact = _.uniq map
		compact

	mappedSkills: (skills, current) ->
		skills.filter (s)-> s.model_pt_br == current

	classSkill: (skills, current) ->
		s = @mappedSkills(skills, current)
		c = "default"
		if s[0]
			switch s[0].name
				when 'manage' then c = 'success'
				when 'show' then c = 'inverse'
		c


	labelSkill: (skills, current) ->
		s = @mappedSkills(skills, current)
		c = "Nenhum"
		if s[0]
			c = s[0].name_pt_br
		c	

	removeSkill: (profile, skill)->
		for x in profile.skills
			if x
				if x.model_pt_br == skill
					index = profile.skills.indexOf(x)
					profile.skills.splice(index, 1)
					true
		return 

	setSkill: (profile, skill, action) ->
		skillObj = @skills.filter((s) => s.model_pt_br == skill && s.name == action)[0]
		unless action
			@removeSkill(profile, skill)
		else
			if profile.skills.filter((f) => f.model_pt_br == skill).length > 0
				@removeSkill(profile, skill)
			profile.skills.push	(skillObj)
		true

	changed: ->
		history = @history.map (m) -> m.skills.sort();
		current = @profiles.map (m) -> m.skills.sort();
		!angular.equals(history, current)

	compare: (profile)->
		history = @history.filter((f) -> f.id == profile.id)[0]
		angular.equals(history.skills.sort(), profile.skills.sort())

	reset: ->
		@profiles = angular.copy(@history)

	save: ->
		@loading = true
		deferred = @q.defer()
		promises = []
		profiles = @profiles.filter (m) => 
			!@compare(m)
		for profile in profiles
			profile.skill_ids = profile.skills.map((s) -> s.id).join(',')
			promises.push @ProfileService.update(profile)
		@q.all(promises).then (result) =>
			@loading = false
			@history = angular.copy @profiles
		deferred.promise

ProfilesController.$inject = ['$q', '$rootScope', 'ProfileService', 'SkillService']

angular
	.module('CCBApp')
	.component 'profilesController', {
		templateUrl: 'controllers/profiles/profiles_view.html'
		controller: ProfilesController
		controllerAs: 'vm'
	}