# -*- encoding : utf-8 -*-
class AddIsAdminToUser < ActiveRecord::Migration
  def change
    add_column :users, :is_admin, :boolean, default: false
    add_column :users, :church_id, :integer
    add_column :users, :church_group_id, :integer
  end
end
