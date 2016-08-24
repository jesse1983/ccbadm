# -*- encoding : utf-8 -*-
class ChangeUserColumns < ActiveRecord::Migration
  def change
  	rename_column :users, :church_group_id, :profile_id
  	add_column :users, :first_name, :string
  	add_column :users, :last_name, :string
  end
end
