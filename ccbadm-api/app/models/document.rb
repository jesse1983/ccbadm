# == Schema Information
#
# Table name: documents
#
#  id                    :integer          not null, primary key
#  document_type_id      :integer
#  expires_at            :datetime
#  is_possible           :boolean
#  is_active             :boolean
#  created_at            :datetime
#  updated_at            :datetime
#  documentable_id       :integer
#  documentable_type     :string(255)
#  attachments_count     :integer          default(0)
#  number                :string(255)
#  issue_date            :datetime
#  active_requests_count :integer
#  status_id             :string
#  comments_count        :integer          default(0)
#
require 'colorize'
class Document < ActiveRecord::Base

	after_initialize :after_initialize
	before_save :status_check

	belongs_to :documentable, polymorphic: true
	belongs_to :status, foreign_key: 'uid', class_name: "Status"
	belongs_to :document_type
	has_many :attachments, as: :attachable
	has_many :requests,->{ where(is_active: true) }, as: :requestable
	has_many :comments,->{ where(is_archived: false) }, as: :commentable


	def after_initialize
		self.is_possible = true  if self.is_possible == nil
		self.is_active   = false if self.is_active == nil
	end

	def status_check
		if self.status_id
			status = Status.find status_id
			self.is_active = status.is_active
			self.status_id = "DOC_UPLOADED" if status.is_active && self.attachments.size > 0
			if self.expires_at_changed?
				unless self.expires_at.nil?
					self.status_id = "DOC_AVAILABLE" if self.expires_at > Time.now
				else
					self.status_id = "DOC_AVAILABLE"
				end
			end
			unless self.expires_at.nil?
				self.status_id = "DOC_EXPIRED"  if self.expires_at < Time.now
			end
		end
	end

	def self.update_active_requests_count
		Document.where("active_requests_count > 0").each do |doc|
			doc.active_requests_count = doc.requests.where(is_active: true).size
			doc.save(validate: false)
		end
		Request.where(is_active: true).each {|req| req.save(validate: false)}
	end
	def update_comments_count
		self.comments_count = Comment.where(commentable_id: self.id, commentable_type: "Document", is_archived: false).size
		self.save(validate: false)
	end
	def self.update_all_comments_count
		Document.where("comments_count > 0").each do |doc|
			doc.update_comments_count
		end
	end
end
