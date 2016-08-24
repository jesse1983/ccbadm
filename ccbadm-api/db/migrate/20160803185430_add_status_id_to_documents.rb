class AddStatusIdToDocuments < ActiveRecord::Migration
  def change
  	change_table :documents do |t|
  		t.references :status
  	end
  end
end
