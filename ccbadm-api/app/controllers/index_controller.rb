class IndexController < ApplicationController
	skip_before_filter :authenticate_user!
	def index
		render layout: false
	end
end