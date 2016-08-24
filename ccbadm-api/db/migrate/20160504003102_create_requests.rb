class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.datetime :requested_at
      t.datetime :returned_at
      t.datetime :return_in
      t.boolean :is_active
      t.references :user
      t.text :requestable_type
      t.integer :requestable_id      
      t.text :requester
      t.text :requester_phone_number
      t.timestamps
    end
  end
end
