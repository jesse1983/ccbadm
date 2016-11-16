object @object => :data
attribute :id
attribute :name
attribute :is_admin
attribute :level
# attribute :last_sign_in_at if @object.last_sign_in_at
child :skills, :object_root => false do
	attributes :id
	attributes :name
	attributes :model
	attributes :name_pt_br
	attributes :model_pt_br
end

node(:url) { url_for([:api, @object]) }