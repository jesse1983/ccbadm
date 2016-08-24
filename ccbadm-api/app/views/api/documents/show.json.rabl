object @object => :data
attribute :id
attribute :is_active
attribute :is_possible
attribute :active_requests_count
attribute :number
attribute :issue_date
attribute :expires_at
attribute :created_at
attribute :updated_at

if expand?(@object, "attachments")
	child :attachments, :root => :attachments, :object_root => false do |object| extends "api/attachments/show" end
else
	attribute :attachments_count
	node(:attachments) { url_for([:api,@object,Attachment]) }
end

if expand?(@object, "comments")
	child :comments, :root => :comments, :object_root => false do |object| extends "api/comments/show" end
else
	attribute :comments_count
	node(:comments) { url_for([:api,@object,Comment]) }
end



if expand?(@object, "document_type")
	child :document_type, :root => :document_type, :object_root => false do |object| extends "api/document_types/show" end
else
	node(:document_type) { "#{api_document_types_path()}/#{@object.document_type_id}" } if @object.document_type_id
end


if expand?(@object, "property")
	child :documentable, :root => :property, :object_root => false do |object| extends "api/properties/show" end
else
	node(:property) { "#{api_properties_path()}/#{@object.documentable_id}" } if @object.documentable_id && @object.documentable_type == "Property"
end

if expand?(@object, "requests")
	child :requests, :root => :requests, :object_root => false do |object| extends "api/requests/show" end
else
	node(:requests) { url_for([:api,@object,Request]) }
	# node(:requests) { url_for([:api,@object,Request]) }
end

if expand?(@object, "status")
	child :status, :root => :status, :object_root => false do |object| extends "api/statuses/show" end
else
	node(:status) { "#{api_statuses_path()}/#{@object.status_id}" } if @object.status_id
end


node(:url) { url_for([:api,@object]) }


# attribute :taxes
