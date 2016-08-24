class AddTerrainToProperty < ActiveRecord::Migration
  def change
    add_column :properties, :category, :string, limit: 64
	add_column :properties, :status, :string, limit: 64
	add_column :properties, :situation, :string, limit: 64
	add_column :properties, :address, :string, limit: 256
	add_column :properties, :zipcode, :string, limit: 9
	add_column :properties, :zone, :string, limit: 12
	add_column :properties, :income, :integer
	add_column :properties, :quarter, :string, limit: 12
	add_column :properties, :court, :string, limit: 12
	add_column :properties, :lot, :string, limit: 12
	add_column :properties, :terrain_area, :decimal, precision: 12, scale: 2
	add_column :properties, :width_area, :decimal, precision: 12, scale: 2
	add_column :properties, :main_area, :decimal, precision: 12, scale: 2
	add_column :properties, :trash_area, :decimal, precision: 12, scale: 2
	add_column :properties, :secondary_area, :decimal, precision: 12, scale: 2
	add_column :properties, :excess_area, :decimal, precision: 12, scale: 2
	add_column :properties, :default_type, :string, limit: 64
	add_column :properties, :default_category, :string, limit: 64
	add_column :properties, :rate, :decimal, precision: 12, scale: 2
	add_column :properties, :comment, :text
	add_column :properties, :object_terrain, :text
  end
end
