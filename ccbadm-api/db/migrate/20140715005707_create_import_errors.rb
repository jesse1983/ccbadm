# -*- encoding : utf-8 -*-
class CreateImportErrors < ActiveRecord::Migration
  def change
    create_table :import_errors do |t|
      t.references :import
      t.string :name

      t.timestamps
    end
  end
end
