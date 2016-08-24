# -*- encoding : utf-8 -*-
class AddReadonlyToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :is_readonly, :boolean, default: false
    add_column :groups, :group_id, :integer
  end
end
