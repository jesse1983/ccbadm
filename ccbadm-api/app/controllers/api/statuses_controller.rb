# -*- encoding : utf-8 -*-
require 'actionpack/action_caching'
class Api::StatusesController < Api::ApiController
	skip_before_filter :authenticate_user!
	respond_to :json,:xml

	caches_action :index, :cache_path => Proc.new { |c| c.params }
	caches_action :show, :cache_path => Proc.new { |c| c.params }


	def index
		@q = Status.search params
		@total, @limit, @offset = header(@q.result)
		@limit = 50
		@data = @q.result.order(:order).limit(@limit).offset(@offset)
	end
	def show
		begin
			@object = Status.find params[:id]
		rescue
			render(:json => {error: "Not found"}, :status => 404)
		end
	end

end
