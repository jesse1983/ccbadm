# -*- encoding : utf-8 -*-
class CreateSkillsUsers < ActiveRecord::Migration
  def change
    create_table :skills_users do |t|
      t.references :user, index: true
      t.references :skill, index: true

      t.timestamps
    end
  end
end
	
