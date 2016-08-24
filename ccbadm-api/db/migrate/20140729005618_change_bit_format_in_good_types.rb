# -*- encoding : utf-8 -*-
class ChangeBitFormatInGoodTypes < ActiveRecord::Migration
  def change
  	change_column :good_types, :main, :boolean, default: false
  	change_column :good_types, :is_width_mandatory, :boolean, default: false
  	change_column :good_types, :is_height_mandatory, :boolean, default: false
  	change_column :good_types, :is_length_mandatory, :boolean, default: false
  end
end
