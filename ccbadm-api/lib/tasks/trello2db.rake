# # http://www.ccbadm.com.br/api/patrimony/cards


# require 'open-uri'
# require 'json'
# require 'colorize'


# desc "Importing from Trello to Postgres"
# task :trello2db => :environment do
# 	json = JSON.parse(RestClient.get "http://www.ccbadm.com.br/api/patrimony/cards")
# 	doctypes = DocumentType.all
# 	json.each do |property|
# 		if property["tags"].length > 0
# 			name_starts = property["name"].split(" ")[0].split(".")[0]
# 			name_ending = property["name"].split(" ")[0].split(".")[1]
# 			name_starts = name_starts.gsub("-","")
# 			name_ending = name_ending.gsub("-","") if name_ending
# 			p = Property.where "is_active = true and accountant_code like '#{name_starts}%' and code like '%#{name_ending}'"
# 			if p.size == 0
# 				p = Property.where "is_active = true and accountant_code like '#{name_starts}%'"
# 			end
# 			if p.size > 1
# 				# 00 end
# 				if name_ending == nil
# 					p = Property.where "is_active = true and accountant_code like '#{name_starts}%' and code like '%00'"
# 				end
# 			end
# 			# Success
# 			if p.size == 1
# 				docts_ids = tags2ids(property["tags"],doctypes)
# 				p.first.documents.where(document_type_id: docts_ids).update_all(is_active: true)
# 				puts "#{p.first.title}: #{docts_ids.size}".green
# 			else
# 				if p.size == 0
# 					puts "Error #{property['name']} not found; #{p.to_sql}".red
# 				else
# 					puts "Error #{property['name']} found #{p.size} times; #{p.to_sql}".yellow
# 				end

# 			end
# 		end
# 	end
# end
# def tags2ids tags, doctypes
# 	ids = []
# 	tags.each do |doc|
# 		dt = doctypes.detect {|d| d.code == doc.split(" ")[0]}
# 		ids.push dt.id
# 	end
# 	ids
# end