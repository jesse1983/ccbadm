# == Schema Information
#
# Table name: attachments
#
#  id              :integer          not null, primary key
#  attachment      :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  attachable_id   :integer
#  attachable_type :string(255)
#

class Attachment < ActiveRecord::Base
	before_destroy :before_destroy
	belongs_to :attachable, polymorphic: true, :counter_cache => true
	mount_uploader :attachment, AttachmentUploader
	validates_presence_of :attachment, :attachable_id, :attachable_type


	def before_destroy
		Cloudinary::Uploader.destroy(self.attachment.file.public_id)
	end
end