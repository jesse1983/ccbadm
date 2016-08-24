class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string  :statusable_type
      t.string  :title
      t.string  :color
      t.boolean :is_active
      t.string  :description
      t.integer :order
      t.json    :meta

      t.timestamps
    end
  end
end
