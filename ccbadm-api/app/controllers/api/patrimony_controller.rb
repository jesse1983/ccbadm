
# class Api::PatrimonyController < ApplicationController
# 	require 'open-uri'
# 	require 'json'

# 	skip_before_filter :authenticate_user!
#   	respond_to :json

# 	def project
# 		docs = []
# 		Trello::Card.only(:tags).where(is_archived: false).each do |c|
# 			docs = c.tags if c.tags.size > docs.size
# 		end
# 		respond_with docs.sort
# 	end
# 	def cards
# 		respond_with Trello::Card.where(is_archived: false).only(:name, :tags, :column)
# 	end
# 	def import
# 		ImportTrello.new
# 		respond_with(:ok => true, :total => Trello::Card.where(is_archived: false).size)
# 	end
# end
