# require 'colorize'

# desc "This task is called by the Heroku scheduler add-on"
# task :update_feed => :environment do
#   puts "Updating feed..."
#   puts "done."
# end


# desc "Trello import"
# task :import_trello => :environment do
#   puts "\033[32mImporting...\033[0m"
#   ImportTrello.new
#   puts "\033[32mWell Done\033[0m"
# end



# desc "Clean up old tokens"
# task :clean_tokens => :environment do
# 	Token.where("expire_at < ?",(Time.now() - 30.minutes)).delete_all
#   	puts "Tokens clean!".green
# end


# desc "Clean up old tokens"
# task :orphans_attachments => :environment do
# 	availables = []
# 	Attachment.where("attachment is not null").each{|attachment|  availables.push attachment.attachment.file.public_id if attachment.attachment }
# 	Church.where("picture is not null").each{|church| availables.push church.picture.file.public_id if church.picture}
# 	storage = getCloudnaryResoucesId nil
# 	removes = storage - availables
# 	puts removes
# 	Cloudinary::Api.delete_resources(removes)
# 	puts "#{removes.size} has been removed. Tks!"
# end

# desc "Update active requests"
# task :update_active_requests_count => :environment do
# 	Document.update_active_requests_count
# end


# def getCloudnaryResoucesId next_cursor
# 	ids = []
# 	params = {}
# 	params = {next_cursor: next_cursor} if next_cursor
# 	results = Cloudinary::Api.resources params
# 	results["resources"].each{|r| ids.push r["public_id"] }
# 	if results["next_cursor"] != nil
# 		ids = ids.concat(getCloudnaryResoucesId(results["next_cursor"]))
# 	end
# 	ids
# end


