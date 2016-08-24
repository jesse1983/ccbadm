object @object => :data
attribute :id
attribute :name
attribute :is_admin
attribute :level
# attribute :last_sign_in_at if @object.last_sign_in_at
child :skills

node(:url) { url_for([:api,@object]) }






# attribute :taxes


