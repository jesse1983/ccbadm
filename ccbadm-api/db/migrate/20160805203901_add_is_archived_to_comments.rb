class AddIsArchivedToComments < ActiveRecord::Migration
  def change
    add_column :comments, :is_archived, :boolean, default: false
  end
end
