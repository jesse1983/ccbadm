desc "Update active requests"
task :update_active_requests_count => :environment do
	Document.update_active_requests_count
end
