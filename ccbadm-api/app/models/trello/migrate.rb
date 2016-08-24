# require 'rest_client'
# require 'json'
# class Trello::Migrate

# 	def initialize del=nil
# 		key_api = "d028a57795b6ee93e689a9028da4c352"
# 		token_api = "fccff79c3c128c034c8f63acd5b4cf3b7d35905debfd5b69d2f7a213c102d1e7"
# 		@auth = {key: key_api, token: token_api}
# 		@url = "https://api.trello.com/1/"
# 		@board = JSON.parse(RestClient.get "#{@url}boards/dClqVyOm", params: @auth)

# 		if del == nil
# 			self.getChurches()
# 			self.createLists()
# 			self.createCards()
# 		else
# 			# Destroy Cards
# 			self.destroyCards()
# 			# Archive Lists
# 			self.destroyLists()
# 		end
# 	end
# 	def createChecklist card_id
# 		params = @auth
# 		params[:name] = "Documentos"
# 		params[:idBoard] = @board["id"]
# 		params[:idCard] = card_id
# 		checklist = JSON.parse(RestClient.post "#{@url}checklists", params)
# 		checklist
# 	end
# 	def createChecklists checklist_id, card_docs

# 		docs = ["01 Contrato do imóvel", "02 Escritura de Compra", "03 Matrícula registral", "04 Projeto de anexação", "04.1 Certidão de anexação", "04.2 Averbação da anexação", "05 Projeto de prefeitura", "05.1 Alvará de execução da obra", "05.2 DIC Matrícula da obra PMC", "05.3 Averbação da construção", "06 CEI Receita Federal", "07 Projeto de bombeiros", "07.1 Vistoria de bombeiros", "08 CCO", "08.1 Alvará de uso", "09 CND Receita Federal", "10 Atualização IPTU"]
# 		docs.each do |d|

# 			params = @auth
# 			params[:name] = d
# 			params[:checked] = (card_docs.include? d)
# 			RestClient.post "#{@url}checklists/#{checklist_id}/checkItems", params

# 		end
# 	end
# 	def getChurches
# 		@churches = JSON.parse(RestClient.get "http://ccbadm.com.br/api/patrimony/cards", params: @auth)
# 	end
# 	def createLists
# 		lists = []
# 		@lists = []
# 		@churches.each do |c|
# 			lists.push c["column"] unless lists.include? c["column"]
# 		end
# 		lists.each do |l|
# 			params = @auth
# 			params[:name] = l
# 			@lists.push JSON.parse(RestClient.post "#{@url}boards/#{@board['id']}/lists", params)
# 		end
# 	end
# 	def createCards
# 		@churches.each do |c|
# 			params = @auth
# 			params[:name] = c["name"]
# 			params[:idBoard] = @board["id"]
# 			params[:due] = nil
# 			params[:urlSource] = nil
# 			params[:idList] = getList c["column"]
# 			card = JSON.parse(RestClient.post "#{@url}cards", params)
# 			checklist = createChecklist(card["id"])
# 			createChecklists(checklist["id"],c["tags"])
# 		end
# 	end
# 	def getList name
# 		@lists.each do |l|
# 			return l["id"] if l["name"] == name
# 		end
# 	end
# 	def destroyLists
# 		lists = JSON.parse(RestClient.get "#{@url}boards/#{@board['id']}/lists", params: @auth)
# 		lists.each do |l|
# 			params = @auth
# 			params[:closed] = true
# 			RestClient.put "#{@url}lists/#{l['id']}/", params
# 		end
# 	end
# 	def destroyCards
# 		cards = JSON.parse(RestClient.get "#{@url}boards/#{@board['id']}/cards", params: @auth)
# 		cards.each do |c|

# 			RestClient.delete "#{@url}cards/#{c['shortLink']}", params: @auth
# 		end
# 	end


# end