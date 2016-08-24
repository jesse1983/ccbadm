# -*- encoding : utf-8 -*-
class AddGroupIdToUser < ActiveRecord::Migration
  def change
    add_reference :users, :group, index: true
  end
end
