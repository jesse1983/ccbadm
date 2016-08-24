# -*- encoding : utf-8 -*-
class AddOtherValueAndOtherProductsValueToInvoice < ActiveRecord::Migration
  def change
  	add_column :invoices, :other_value, :decimal, precision: 10, scale: 2
  	add_column :invoices, :other_products_value, :decimal, precision: 10, scale: 2
  end
end
