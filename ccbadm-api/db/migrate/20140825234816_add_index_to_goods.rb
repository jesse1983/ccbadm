class AddIndexToGoods < ActiveRecord::Migration
  def change
  	add_index :goods, :church_id
  	add_index :goods, :good_type_id
  end
end
