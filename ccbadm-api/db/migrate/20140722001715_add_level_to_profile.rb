# -*- encoding : utf-8 -*-
class AddLevelToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :level, :integer
  end
end
