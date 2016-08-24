# -*- encoding : utf-8 -*-
class ChangeNumberToInvoices < ActiveRecord::Migration
  def change
  	change_column :invoices, :number, :string, limit: 64
  end
end
