class AddUidToStatus < ActiveRecord::Migration
  def change
    add_column :statuses, :uid, :string
  end
end
