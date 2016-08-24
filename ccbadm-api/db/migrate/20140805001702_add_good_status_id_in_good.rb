# -*- encoding : utf-8 -*-
class AddGoodStatusIdInGood < ActiveRecord::Migration
  def change
    add_reference :goods, :good_status, index: true
    
  end
end
