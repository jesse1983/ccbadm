object @object => :data
attribute :id
attribute :text
attribute :is_archived
attribute :created_at
attribute :updated_at


child :user, :root => :user, :object_root => false do |object| extends "api/users/show" end

if @object.commentable_type == "Document"
	if expand?(@object, "document")
		child :commentable, :root => :document, :object_root => false do |object| extends "api/documents/show" end
	else
		node(:document) { "#{api_documents_path()}/#{@object.commentable_id}" } if @object.commentable_id
	end
end
# node(:attachment) { @object.attachment.url}
# node(:user) { @object.attachment.url}
node(:url) { url_for([:api,@object]) }
