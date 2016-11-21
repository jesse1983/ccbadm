# -*- encoding : utf-8 -*-
# require 'actionpack/action_caching'
class Api::ProfilesController < Api::ApiController
	skip_before_filter :authenticate_user!
	respond_to :json,:xml

	def index
		authorize! :show, Profile
		params[:level_gt] = @current_user.profile.level
		@q = Profile.search params
		@total, @limit, @offset = header(@q.result)
		@data = @q.result.limit(@limit).offset(@offset)
	end
	def show
		authorize! :show, Profile
		begin
			@object = Profile.find params[:id]
		rescue
			render(:json => {error: "Not found"}, :status => 404)
		end
	end
	def update
		@object = Profile.find params[:id]	
		authorize! :update, @object
		if @object.update get_params
			render :template => "api/#{controller_name}/show"
		else
			render(:json => {errors: @object.errors}, :status => 400)
		end
	end
	def destroy
		@object = Profile.find params[:id]
		authorize! :destroy, @object
		if @object.destroy
			render(:json => {destroy: true}, :status => 200)
		else
			render(:json => {errors: @object.errors}, :status => 400)
		end
	end


	protected
	def get_params
		p = params.permit(
			:name,
			:is_admin,
			:level,
			:skill_ids
		)
		if (p[:skill_ids]) 
			p[:skill_ids] = p[:skill_ids].split(",") { |s| s.to_i+1 }
		end
		p
	end

end
