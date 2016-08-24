# == Schema Information
#
# Table name: properties
#
#  id                :integer          not null, primary key
#  code              :string(255)
#  church_id         :integer
#  group_code        :string(255)
#  accountant_code   :string(255)
#  cartographic_code :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  is_active         :boolean          default(TRUE)
#  has_church        :boolean          default(FALSE)
#  market_price      :decimal(10, 2)
#  object            :json
#  title             :string(255)
#  category          :string(64)
#  status            :string(64)
#  situation         :string(64)
#  address           :string(256)
#  zipcode           :string(9)
#  zone              :string(12)
#  income            :integer
#  quarter           :string(12)
#  court             :string(12)
#  lot               :string(12)
#  terrain_area      :decimal(12, 2)
#  width_area        :decimal(12, 2)
#  main_area         :decimal(12, 2)
#  trash_area        :decimal(12, 2)
#  secondary_area    :decimal(12, 2)
#  excess_area       :decimal(12, 2)
#  default_type      :string(64)
#  default_category  :string(64)
#  rate              :decimal(12, 2)
#  comment           :text
#  object_terrain    :text
#  latitude          :float
#  longitude         :float
#  full_address      :string(255)
#  tax_code          :string(255)
#

class Property < ActiveRecord::Base

	# after_save :after_save
	belongs_to :church
	has_many :taxes
	has_many :documents, as: :documentable


	geocoded_by :full_address
	after_validation :geocode

	def after_save
		dt = DocumentType.all
		if self.documents.size != dt.size
			# Delete excess
			self.documents.destroy("documentable_id not in (#{self.documents.map{|d| d.id}.join(',')}) and documentable_type = 'Property'")
			# Create missing
			dt.each do |t|
				self.documents.find_or_create_by(document_type_id: t.id)
			end
		end
	end
end
