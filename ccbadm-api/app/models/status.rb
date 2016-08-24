# == Schema Information
#
# Table name: statuses
#
#  uid             :string           not null, primary key
#  statusable_type :string           not null
#  title           :string           not null
#  color           :string
#  is_active       :boolean
#  description     :string
#  order           :integer
#  meta            :json
#  created_at      :datetime
#  updated_at      :datetime
#

class Status < ActiveRecord::Base
	self.primary_key = :uid
end
