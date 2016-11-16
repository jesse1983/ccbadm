# -*- encoding : utf-8 -*-
require 'actionpack/action_caching'
class Api::SkillsController < Api::ApiController
	skip_before_filter :authenticate_user!
	respond_to :json,:xml

	caches_action :index, :cache_path => Proc.new { |c| c.params }
	caches_action :show, :cache_path => Proc.new { |c| c.params }

	def index
		@q = Skill.search params
		@total, @limit, @offset = header(@q.result)
		@data = @q.result.limit(@limit).offset(@offset)
	end

	def show
		begin
			@object = Skill.find params[:id]
		rescue
			render(:json => {error: "Not found"}, :status => 404)
		end
	end

end
