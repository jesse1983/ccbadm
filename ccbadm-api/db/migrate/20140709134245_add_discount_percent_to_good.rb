# -*- encoding : utf-8 -*-
class AddDiscountPercentToGood < ActiveRecord::Migration
  def change
    add_column :goods, :discount_percent, :decimal, precision: 10, scale: 2
  end
end
