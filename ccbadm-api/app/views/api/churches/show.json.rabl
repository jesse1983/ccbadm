object @object => :data
attribute :id
attribute :name
attribute :bras_code
attribute :heritage_code
# attribute :2000_code
attribute :created_at
attribute :updated_at
attribute :group_id


node(:picture) { @object.picture.url } if @object.picture?
node(:picture_id) { @object.picture.file.public_id } if @object.picture?
if expand?(@object, "properties") 
	child :properties, :root => :properties, :object_root => false do |object| extends "api/properties/show" end
else
	node(:properties) { url_for([:api,@object,Property]) }
end
if expand?(@object, "users") 
	child :users, :root => :users, :object_root => false do |object| extends "api/users/show" end
else
	node(:users) { url_for([:api,@object,User]) }
end

node(:url) { url_for([:api,@object]) }

