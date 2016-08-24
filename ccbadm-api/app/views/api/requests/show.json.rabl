object @object => :data
attribute :id
attribute :created_at
attribute :updated_at
attribute :requested_at
attribute :returned_at
attribute :requester
attribute :requester_phone_number
attribute :requester_church
attribute :return_in
attribute :is_active
attribute :is_expired
attribute :comment
attribute :meta
# attribute :requestable_type

if expand?(@object, "user")
	child :user, :root => :user, :object_root => false do |object| extends "api/users/show" end
else
	node(:user) { "#{api_users_path()}/#{@object.user_id}" } if @object.user_id
end

if @object.requestable_type == "Document"
	if expand?(@object, "document")
		child :requestable, :root => :document, :object_root => false do |object| extends "api/documents/show" end
	else
		node(:document) { "#{api_documents_path()}/#{@object.requestable_id}" } if @object.requestable_id
	end
end
# node(:attachment) { @object.attachment.url}
# node(:user) { @object.attachment.url}
node(:url) { url_for([:api,@object]) }
