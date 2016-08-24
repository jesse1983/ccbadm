# -*- encoding : utf-8 -*-
class Skills < ActiveRecord::Migration
  def change
	create_table :skills do |t|
      t.string :name
      t.string :model
      t.string :name_pt_br
      t.string :model_pt_br
 
      t.timestamps
    end  	
  end
end
