desc "Clean up old tokens"
task :orphans_attachments => :environment do
	availables = []
	Attachment.where("attachment is not null").each{|attachment|  availables.push attachment.attachment.file.public_id if attachment.attachment }
	Church.where("picture is not null").each{|church| availables.push church.picture.file.public_id if church.picture}
	storage = getCloudnaryResoucesId nil
	removes = storage - availables
	puts removes
	Cloudinary::Api.delete_resources(removes)
	puts "#{removes.size} has been removed. Tks!"
end

def getCloudnaryResoucesId next_cursor
	ids = []
	params = {}
	params = {next_cursor: next_cursor} if next_cursor
	results = Cloudinary::Api.resources params
	results["resources"].each{|r| ids.push r["public_id"] }
	if results["next_cursor"] != nil
		ids = ids.concat(getCloudnaryResoucesId(results["next_cursor"]))
	end
	ids
end