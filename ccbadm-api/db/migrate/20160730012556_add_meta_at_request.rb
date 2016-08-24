class AddMetaAtRequest < ActiveRecord::Migration
  def change
  	add_column :requests, :meta, :json
  end
end
