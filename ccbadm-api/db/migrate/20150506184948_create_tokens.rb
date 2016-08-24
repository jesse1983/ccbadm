class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.string :token
      t.references :user
      t.datetime :expire_at
      t.timestamps
    end
  end
end
