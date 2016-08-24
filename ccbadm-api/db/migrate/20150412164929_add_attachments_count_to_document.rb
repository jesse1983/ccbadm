class AddAttachmentsCountToDocument < ActiveRecord::Migration
  def change
    add_column :documents, :attachments_count, :integer, default: 0
  end
end
