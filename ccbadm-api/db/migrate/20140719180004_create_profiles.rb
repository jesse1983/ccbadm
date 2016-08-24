# -*- encoding : utf-8 -*-
class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.boolean :is_admin

      t.timestamps
    end
  end
end
