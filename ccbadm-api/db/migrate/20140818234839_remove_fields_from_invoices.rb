class RemoveFieldsFromInvoices < ActiveRecord::Migration
  def change
    remove_column :invoices, :heritage_code, :string
    remove_column :invoices, :accounting_year, :string
    remove_column :invoices, :accounting_month, :string
    remove_column :invoices, :accounting_code, :string
    add_column 	:invoices, :discount_apply, :string
  end
end
