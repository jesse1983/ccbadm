object @object => :data
attribute :id
attribute :created_at
attribute :updated_at


if @object.attachable_type == "Document"
	if expand?(@object, "document") 
		child :document, :root => :document, :object_root => false do |object| extends "api/documents/show" end
	else
		node(:document) { "#{api_documents_path()}/#{@object.attachable_id}" } if @object.attachable_id
	end
end	
node(:attachment) { @object.attachment.url}
node(:url) { url_for([:api,@object]) }


# attribute :taxes


