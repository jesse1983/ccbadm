class AddCodeToDocumentType < ActiveRecord::Migration
  def change
    add_column :document_types, :code, :string
    add_column :document_types, :short_name, :string



    DocumentType.all.each do |d|
    	title = d.title.split(" ")
    	d.code = title[0]
    	title.delete_at(0)
    	d.short_name = title.join(" ")
    	d.save
    end

  end
end
