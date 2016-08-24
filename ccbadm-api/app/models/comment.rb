# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  commentable_type :text
#  commentable_id   :integer
#  text             :text
#  user_id          :integer
#  created_at       :datetime
#  updated_at       :datetime
#  is_archived      :boolean          default(FALSE)
#

class Comment < ActiveRecord::Base
	belongs_to :commentable, polymorphic: true
	belongs_to :user

	after_save :after_save

	def after_save
		if self.commentable_type == "Document"
			Document.find(self.commentable_id).update_comments_count()
		end
	end
end
