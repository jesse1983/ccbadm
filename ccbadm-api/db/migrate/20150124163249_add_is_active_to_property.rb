class AddIsActiveToProperty < ActiveRecord::Migration
  def change
    add_column :properties, :is_active, :boolean, default: true
    add_column :properties, :has_church, :boolean, default: false
    add_column :properties, :market_price, :decimal, :precision => 10, :scale => 2
  end
end
