class ChangeInvoiceValueIntegerToFloat < ActiveRecord::Migration
  def change
  	change_column :goods_invoices, :invoice_value, :decimal, :precision => 10, :scale => 4
  	change_column :invoices, :discount_percent, :decimal, :precision => 10, :scale => 4
  end
end
