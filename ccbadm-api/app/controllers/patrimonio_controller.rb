class PatrimonioController < ApplicationController
	skip_before_filter :authenticate_user!
	def index
		render layout: false
	end
	def migracao
		t = Trello::Request.create env: Rails.env, referrer: request.referrer, params: params
		render text: t.attributes.to_yaml
	end
end