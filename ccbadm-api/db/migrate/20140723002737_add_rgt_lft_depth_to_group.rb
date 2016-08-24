# -*- encoding : utf-8 -*-
class AddRgtLftDepthToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :lft, :integer, index: true
    add_column :groups, :rgt, :integer, index: true
    add_column :groups, :depth, :integer, index: true
  end
end
