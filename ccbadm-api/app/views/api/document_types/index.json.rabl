object false
extends "api/header"
child @data, :root => :data, :object_root => false do |object| 
	extends "api/#{controller_name}/show"
end
