# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: groups
#
#  id          :integer          not null, primary key
#  name        :string(510)
#  created_at  :datetime
#  updated_at  :datetime
#  is_readonly :boolean
#  group_id    :integer
#  lft         :integer
#  rgt         :integer
#  depth       :integer
#

class Group < ActiveRecord::Base
	# has_paper_trail
	acts_as_nested_set parent_column: "group_id"

	belongs_to :group, class_name: "Group", foreign_key: "group_id"
	has_many :groups, -> { where group_id: self.id }, class_name: "Group"
  	has_many :users




end
