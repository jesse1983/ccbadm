class AddAttachableToAttachments < ActiveRecord::Migration
  def change
    add_reference :attachments, :attachable, polymorphic: true, index: true
    drop_table :attachments_documents
  end
end
