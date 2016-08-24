class AddPictureToChurches < ActiveRecord::Migration
  def change
    add_column :churches, :picture, :string
  end
end
