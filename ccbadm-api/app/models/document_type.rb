# == Schema Information
#
# Table name: document_types
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  order        :integer
#  is_mandatory :boolean          default(TRUE)
#  is_active    :boolean          default(TRUE)
#  created_at   :datetime
#  updated_at   :datetime
#  code         :string(255)
#  short_name   :string(255)
#  is_expirable :boolean          default(FALSE)
#

class DocumentType < ActiveRecord::Base



	def swap title
		doc = DocumentType.where("title like '#{title}%'")
		if doc.size > 0
			doc = doc.first
			self.title  = doc.title 
			self.order = doc.order
			self.is_mandatory = doc.is_mandatory
			self.is_active = doc.is_active
			self.code = doc.code
			self.short_name = doc.short_name
			self.is_expirable = doc.is_expirable
		end
		self
	end
end
