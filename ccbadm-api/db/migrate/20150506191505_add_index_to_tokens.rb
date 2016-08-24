class AddIndexToTokens < ActiveRecord::Migration
  def change
    add_index :tokens, :token
    add_index :tokens, :user_id
  end
end
