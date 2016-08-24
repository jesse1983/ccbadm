class AddNumberDateToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :number, :string
    add_column :documents, :issue_date, :datetime
  end
end
