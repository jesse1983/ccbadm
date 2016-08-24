class AddIsExpirableToDocument < ActiveRecord::Migration
  def change
    add_column :document_types, :is_expirable, :boolean, default: false
    DocumentType.update_all({is_expirable: false})
  end

end
