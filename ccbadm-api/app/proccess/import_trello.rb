# require 'open-uri'
# require 'json'
# class ImportTrello
# 	def initialize
# 		json = JSON.parse(RestClient.get "https://trello.com/b/dClqVyOm.json")
# 		#Delete all arquived
# 		Trello::Card.where(is_archived: true).delete
# 		json["cards"].each do |card|
# 			unless getListById(json, card["idList"])["closed"]
# 				object = Hash.new
# 				object["name"] = card["name"]
# 				object["column"] = getListById(json, card["idList"])["name"]
# 				object["tags"] = getChecklistById json, card["id"]
# 				#Add as archived
# 				object["is_archived"] = true
# 				Trello::Card.create(object)
# 			end
# 		end
# 		#Delete all published
# 		Trello::Card.where(is_archived: false).delete
# 		#Update arquived to published
# 		Trello::Card.update_all(is_archived: false)

# 	end

# 	private

# 	def getListById json, idList

# 		json["lists"].each do |list|
# 			return list if idList == list["id"]
# 		end
# 	end
# 	def getChecklistById json, idCard
# 		items = []
# 		json["checklists"].each do |checklist|
# 			if idCard == checklist["idCard"]
# 				checklist["checkItems"].each do |item|
# 					items.push item["name"] if item["state"] == "complete"
# 				end
# 			end
# 		end
# 		return items
# 	end
# end


