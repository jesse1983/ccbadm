# -*- encoding : utf-8 -*-
require 'actionpack/action_caching'
class Api::ProfilesController < Api::ApiController
	skip_before_filter :authenticate_user!
	respond_to :json,:xml

	caches_action :index, :cache_path => Proc.new { |c| c.params }
	caches_action :show, :cache_path => Proc.new { |c| c.params }



	def index
		params[:level_gt] = @current_user.profile.level
		@q = Profile.search params
		@total, @limit, @offset = header(@q.result)
		@data = @q.result.limit(@limit).offset(@offset)
	end
	def show
		begin
			@object = Profile.find params[:id]
		rescue
			render(:json => {error: "Not found"}, :status => 404)
		end
	end
	def update
		@object = Profile.find params[:id]
		if @object.update get_params
			render :template => "api/#{controller_name}/show"
		else
			render(:json => {errors: @object.errors}, :status => 400)
		end

	end
	def destroy
		@object = Profile.find params[:id]
		if @object.destroy
			render(:json => {destroy: true}, :status => 200)
		else
			render(:json => {errors: @object.errors}, :status => 400)
		end
	end


	protected
	def get_params
		params.permit(
			:name,
			:is_admin,
			:level,
			:skill_ids
		)
	end

end
