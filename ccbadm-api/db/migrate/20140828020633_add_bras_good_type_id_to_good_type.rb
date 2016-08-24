class AddBrasGoodTypeIdToGoodType < ActiveRecord::Migration
  def change
    add_column :good_types, :bras_good_type_id, :integer
  end
end
