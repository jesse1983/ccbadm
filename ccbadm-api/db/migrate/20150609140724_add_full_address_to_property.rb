class AddFullAddressToProperty < ActiveRecord::Migration
  def change
    add_column :properties, :full_address, :string
  end
end
