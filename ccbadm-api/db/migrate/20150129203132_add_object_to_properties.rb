class AddObjectToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :object, :json
    add_column :taxes, :object, :json
  end
end
