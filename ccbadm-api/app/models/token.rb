# == Schema Information
#
# Table name: tokens
#
#  id         :integer          not null, primary key
#  token      :string(255)
#  user_id    :integer
#  expire_at  :datetime
#  created_at :datetime
#  updated_at :datetime
#

class Token < ActiveRecord::Base

	belongs_to :user

	validates_presence_of :user_id

	before_create :before_create
	after_touch :after_touch
	before_destroy :before_destroy


	def before_create
		self.token = SecureRandom.hex
		self.expire_at = Time.now + 30.minutes
	end
	def after_touch
		if self.expire_at > Time.now
			self.expire_at = Time.now + 30.minutes
			self.save!
		else
			self.delete
		end
	end
	def before_destroy
		Rails.cache.delete "token:#{self.token}"
	end
end
