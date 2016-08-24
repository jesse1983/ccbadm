class AddTaxCodetoProperty < ActiveRecord::Migration
  def change
    add_column :properties, :tax_code, :string
  end
end
