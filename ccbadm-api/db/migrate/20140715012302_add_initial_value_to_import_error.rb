# -*- encoding : utf-8 -*-
class AddInitialValueToImportError < ActiveRecord::Migration
  def change
    add_column :import_errors, :initial_value, :string
  end
end
