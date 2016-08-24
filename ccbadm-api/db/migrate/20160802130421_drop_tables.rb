class DropTables < ActiveRecord::Migration
  def change
  	drop_table :collections
  	drop_table :corrections
  	drop_table :file_packages
  	drop_table :good_statuses
  	drop_table :good_types
  	drop_table :goods_invoices
  	drop_table :import_errors
  	drop_table :materials
  	drop_table :places
  	drop_table :taxes

  	drop_table :invoices, force: :cascade
  	drop_table :goods, force: :cascade
  end
end
