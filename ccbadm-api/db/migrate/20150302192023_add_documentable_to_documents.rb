class AddDocumentableToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :documentable_id, :integer
    add_column :documents, :documentable_type, :string
    remove_column :documents, :property_id
    add_index :documents, :documentable_id
  end
end
