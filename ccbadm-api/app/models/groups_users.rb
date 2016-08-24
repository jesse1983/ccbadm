# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: groups_users
#
#  id         :integer          not null, primary key
#  group_id   :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class GroupsUsers < ActiveRecord::Base
  # has_paper_trail
  belongs_to :group
  belongs_to :user
end
