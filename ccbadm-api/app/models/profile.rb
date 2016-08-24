# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: profiles
#
#  id         :integer          not null, primary key
#  name       :string(510)
#  is_admin   :boolean
#  created_at :datetime
#  updated_at :datetime
#  level      :integer
#

class Profile < ActiveRecord::Base
  	# has_paper_trail
	has_and_belongs_to_many :skills
	has_many :users
end
