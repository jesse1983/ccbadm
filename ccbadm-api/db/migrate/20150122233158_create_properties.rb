class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
		t.string :code
		t.references :church, index: true
		t.string :group_code
		t.string :accountant_code
		t.string :cartographic_code
      t.timestamps
    end
  end
end
