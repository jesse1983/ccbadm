# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: skills
#
#  id          :integer          not null, primary key
#  name        :string(510)
#  model       :string(510)
#  name_pt_br  :string(510)
#  model_pt_br :string(510)
#  created_at  :datetime
#  updated_at  :datetime
#

class Skill < ActiveRecord::Base
  # has_paper_trail
	has_and_belongs_to_many :profiles
end
