class AddCommentsCountToDocuments < ActiveRecord::Migration
  def change
  	change_table :documents do |t|
  		t.integer :comments_count, default: 0
  	end
  	Document.where("comments_count > 0").each { |d| Document.reset_counters(d.id,:comments) }
  	Comment.all.each { |c| c.save(validate: false) }
  end
end
