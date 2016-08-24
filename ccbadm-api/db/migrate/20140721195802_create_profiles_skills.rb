# -*- encoding : utf-8 -*-
class CreateProfilesSkills < ActiveRecord::Migration
  def change
    create_table :profiles_skills do |t|
      t.references :profile, index: true
      t.references :skill, index: true

      t.timestamps
    end
  end
end
