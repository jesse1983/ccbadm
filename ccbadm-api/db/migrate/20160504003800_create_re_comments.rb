class CreateReComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :commentable_type
      t.integer :commentable_id	
      t.text :text
      t.references :user
      t.timestamps
    end
  end
end
