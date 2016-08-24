# == Schema Information
#
# Table name: taxes
#
#  id                :integer          not null, primary key
#  property_id       :integer
#  category          :integer
#  owner_name        :string(255)
#  buyer_name        :string(255)
#  shipping_address  :string(255)
#  comments          :text
#  property_immunity :boolean          default(FALSE)
#  trash_immunity    :boolean          default(FALSE)
#  casualty_immunity :boolean          default(FALSE)
#  immunity_number   :string(255)
#  immunity_file     :string(255)
#  unified           :boolean          default(FALSE)
#  unified_number    :string(255)
#  unified_file      :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  object            :json
#

class Tax < ActiveRecord::Base
	belongs_to :property
	enum :category => {property: 1}
end
