# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: profiles_skills
#
#  id         :integer          not null, primary key
#  profile_id :integer
#  skill_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class ProfilesSkills < ActiveRecord::Base
  # has_paper_trail
  belongs_to :profile
  belongs_to :skill
end
