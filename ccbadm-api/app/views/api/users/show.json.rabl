object @object => :data
attribute :id
attribute :name
attribute :email
attribute :first_name
attribute :last_name
attribute :is_admin
# attribute :last_sign_in_at if @object.last_sign_in_at
if expand?(@object, "profile") 
	child :profile, :root => :profile, :object_root => false do |object| extends "api/profiles/show" end
else
	node(:profile) { "#{api_profiles_path()}/#{@object.profile_id}" } if @object.profile_id
end

if params[:expand]
	if params[:expand].include?("church") then attribute :church  else node(:church) { url_for([:api,@object.church]) } end
else
	node(:church) { url_for([:api,@object.church]) } if @object.church
end


node(:url) { url_for([:api,@object]) }






# attribute :taxes


