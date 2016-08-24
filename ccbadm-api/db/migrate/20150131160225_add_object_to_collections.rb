class AddObjectToCollections < ActiveRecord::Migration
  def change
    add_column :collections, :object, :json
  end
end
