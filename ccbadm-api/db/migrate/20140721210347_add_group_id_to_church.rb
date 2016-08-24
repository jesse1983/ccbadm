# -*- encoding : utf-8 -*-
class AddGroupIdToChurch < ActiveRecord::Migration
  def change
    add_reference :churches, :group, index: true
  end
end
