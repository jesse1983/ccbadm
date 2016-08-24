class AddActiveRequestsCountAtDocuments < ActiveRecord::Migration
  def change
  	  add_column :documents, :active_requests_count, :integer
  end
end
