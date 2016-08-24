object @user => :data
attribute :id
attribute :email
attribute :first_name
attribute :last_name
attribute :is_admin
node(:token){ @token.token }
node(:profile){ @user.profile }
# glue(@token) {|t| attribute :token  }
if expand?(@object, "church") 
	child :church, :root => :church, :object_root => false do |object| extends "api/churches/show" end
else
	node(:church) { "#{api_churches_path()}/#{@user.church_id}" } if @user.church_id
end

child :grouped_skills, :root => :skills, :object_root => false do
	node(:resource){|m| m[:resource]}
	node(:can){|m| m[:can]}
end

node(:url) { url_for([:api,"login"]) }

