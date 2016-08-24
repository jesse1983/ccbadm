# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: churches
#
#  id            :integer          not null, primary key
#  name          :string(510)
#  bras_code     :string(510)
#  heritage_code :string(510)
#  2000_code     :string(510)
#  created_at    :datetime
#  updated_at    :datetime
#  group_id      :integer
#  picture       :string(255)
#

class Church < ActiveRecord::Base
	require 'carrierwave/orm/activerecord'
	# has_paper_trail
	has_many :goods
	has_many :invoices
	has_many :view_goods
	has_many :properties
	belongs_to :group

	mount_uploader :picture, PictureUploader

	validates :name, presence: true
	validates :bras_code, presence: true

	attr_accessor :count_without_invoice

	def get_count_without_invoice
		self.count_without_invoice = self.view_goods.sum(:count_without_invoice) if self.view_goods.present?
	end



	def percent_done
		p = 0.0
		# if self.view_goods?
		# 	c = self.view_goods.sum(:count)
		# 	p = ((c - get_count_without_invoice()) * 100) / c
		# end
		# p = 0 if p < 0
		p
	end

	def addPicture
		if self.name != nil
			name = self.name
			name = name.gsub("Pq.","Parque")
			name = name.gsub("Jd.","Jardim")
			name = name.gsub("Vl.","Vila")
			name = name.gsub("Res.","Residencial")
			name = name.gsub("Ch.","Chacara")
			name = name.parameterize
			begin
				f = File.open "vendor/assets/images/#{name}.jpg"
				if f != nil
					self.picture = f
					self.save
					puts "#{self.name} saved!"
				end
			rescue
				puts puts "#{name} not exists!"
			end
		end
	end
end
