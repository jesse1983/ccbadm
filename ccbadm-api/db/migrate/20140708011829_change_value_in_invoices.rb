# -*- encoding : utf-8 -*-
class ChangeValueInInvoices < ActiveRecord::Migration
  def change
  	change_column :invoices, :value, :decimal, scale: 2, precision: 10
  	change_column :invoices, :discount_value, :decimal, scale: 2, precision: 10
  end
end
