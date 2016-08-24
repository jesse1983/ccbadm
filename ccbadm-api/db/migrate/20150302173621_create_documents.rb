class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.references :property, index: true
      t.references :document_type, index: true
      t.datetime :expires_at
      t.boolean :is_possible
      t.boolean :is_active
      t.timestamps
    end
  end
end
