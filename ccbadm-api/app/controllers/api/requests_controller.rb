# -*- encoding : utf-8 -*-
class Api::RequestsController < Api::ApiController
	skip_before_filter :authenticate_user!
	respond_to :json,:xml

	def index
		ransacklize params, "document_id", "requestable"
		@q = Request.search params
		@total, @limit, @offset = header(@q.result)
		@data = @q.result.limit(@limit).offset(@offset)
	end
	def show
		begin
			@object = Request.find params[:id]
		rescue
			render(:json => {error: "Not found"}, :status => 404)
		end
	end
	def create
		@object = Request.new get_params
		@object.user_id = @current_user.id
		if @object.save
			# @object.requestable_type.constantize.reset_counters @object.requestable_id, :requests
			render :template => "api/#{controller_name}/show"
		else
			render(:json => {errors: @object.errors}, :status => 400)
		end
		# authorize! :update, @user
	end
	def update
		@object = Request.find params[:id]
		if @object.update get_params
			render :template => "api/#{controller_name}/show"
		else
			render(:json => {errors: @object.errors}, :status => 400)
		end
	end
	def destroy
		@object = Request.find params[:id]
		if @object.destroy
			render(:json => {destroy: true}, :status => 200)
		else
			render(:json => {errors: @object.errors}, :status => 400)
		end
	end

	protected
    def get_params
      polymorphicalize params, "document_id", "requestable"
      params.permit(
      	:id,
      	:requestable_id,
      	:requestable_type,
		:requested_at,
		:returned_at,
		:return_in,
		:requester,
		:requester_phone_number,
		:requester_church,
		:comment
	  )
    end


end
