class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :attachments, :documents do |t|
      t.index [:attachment_id, :document_id]
      # t.index [:document_id, :attachment_id]
    end
  end
end
