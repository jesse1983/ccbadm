class AddRequesterChurchToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :requester_church, :string
    add_column :requests, :comment, :text
  end
end
