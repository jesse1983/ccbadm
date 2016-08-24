# == Schema Information
#
# Table name: requests
#
#  id                     :integer          not null, primary key
#  requested_at           :datetime
#  returned_at            :datetime
#  return_in              :datetime
#  is_active              :boolean
#  user_id                :integer
#  requestable_type       :text
#  requestable_id         :integer
#  requester              :text
#  requester_phone_number :text
#  created_at             :datetime
#  updated_at             :datetime
#  requester_church       :string
#  comment                :text
#  meta                   :json
#

require 'colorize'
class Request < ActiveRecord::Base
	belongs_to :requestable, polymorphic: true
	belongs_to :user
	has_many :comments, as: :commentable

	after_initialize :after_initialize
	before_save :activer, :meta
	after_save :counter

	validates :requested_at, presence: true
	validates :requester, presence: true
	validates :user_id, presence: true
	validates :requestable_id, presence: true
	validates :requestable_type, presence: true

	attr_accessor :is_expired

	def after_initialize
		if self.return_in
			self.is_expired = (self.return_in < Time.now)
		end
	end

	def activer
		if self.returned_at != nil
			self.is_active = 0
			# self.is_active = false
		else
			self.is_active = 1
		end
	end

	def meta
		if self.requestable_type == "Document"
			self.meta = {
				document: self.requestable.as_json,
				document_type: self.requestable.document_type.as_json,
				church: self.requestable.documentable.church.as_json,
				property: self.requestable.documentable.as_json(except: [:object, :object_terrain, :comment])
			}
		end
	end

	def counter
		if self.requestable_type == "Document"
			active_requests_count = Request.where(requestable_id: self.requestable_id, is_active: 1).size
			doc = Document.find(self.requestable_id)
			if doc
				doc.active_requests_count = active_requests_count
				doc.save()
			end
		end
	end

end
