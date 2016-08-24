# -*- encoding : utf-8 -*-
class AddValueOnInvoiceToGood < ActiveRecord::Migration
  def change
    add_column :goods_invoices, :id, :primary_key
    add_column :goods_invoices, :invoice_value, :decimal
  end
end
