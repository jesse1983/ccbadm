# -*- encoding : utf-8 -*-
class CreateGoodStatuses < ActiveRecord::Migration
  def change
    create_table :good_statuses do |t|
      t.string :name

      t.timestamps
    end
  end
end
