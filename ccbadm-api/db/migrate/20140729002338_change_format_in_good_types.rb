# -*- encoding : utf-8 -*-
class ChangeFormatInGoodTypes < ActiveRecord::Migration
  def change
  	change_column :good_types, :accounting_code, :integer
  end
end
