class RecreateStatus < ActiveRecord::Migration
  def change
  	drop_table :statuses
    Document.update_all status_id: nil
    create_table :statuses, {id: false} do |t|
      t.string  :uid, primary_key: true, :null => false
      t.string  :statusable_type, :null => false
      t.string  :title, :null => false
      t.string  :color
      t.boolean :is_active
      t.string  :description
      t.integer :order
      t.json    :meta
      t.timestamps
    end
    change_column :documents, :status_id, :string
  end
  # Rake::Task['seed_status'].invoke
end
