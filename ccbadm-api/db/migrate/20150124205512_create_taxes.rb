class CreateTaxes < ActiveRecord::Migration
  def change
	create_table :taxes do |t|
		t.references :property, index: true
		t.integer :category
		t.string :owner_name
		t.string :buyer_name
		t.string :shipping_address
		t.text :comments
		t.boolean :property_immunity, default: false
		t.boolean :trash_immunity, default: false
		t.boolean :casualty_immunity, default: false
		t.string :immunity_number
		t.string :immunity_file
		t.boolean :unified, default: false
		t.string :unified_number
		t.string :unified_file


		t.timestamps
    end
  end
end
