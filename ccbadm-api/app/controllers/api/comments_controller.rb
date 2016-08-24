# -*- encoding : utf-8 -*-
class Api::CommentsController < Api::ApiController
	skip_before_filter :authenticate_user!
	respond_to :json,:xml

	def index
		ransacklize params, "document_id", "commentable"
		params[:is_archived_eq] = false
		@q = Comment.search params
		@total, @limit, @offset = header(@q.result)
		@data = @q.result.limit(@limit).offset(@offset)
	end
	def show
		begin
			@object = Comment.find params[:id]
		rescue
			render(:json => {error: "Not found"}, :status => 404)
		end
	end
	def create
		@object = Comment.new get_params
		@object.user_id = @current_user.id
		if @object.save
			# @object.commentable_type.constantize.reset_counters @object.commentable_id, :comments
			render :template => "api/#{controller_name}/show"
		else
			render(:json => {errors: @object.errors}, :status => 400)
		end
		# authorize! :update, @user
	end
	def update
		@object = Comment.find params[:id]
		if @object.update get_params
			render :template => "api/#{controller_name}/show"
		else
			render(:json => {errors: @object.errors}, :status => 400)
		end
	end
	def destroy
		@object = Comment.find params[:id]
		@object.is_archived = true
		if @object.save()
			render(:json => {destroy: true}, :status => 200)
		else
			render(:json => {errors: @object.errors}, :status => 400)
		end
	end

	protected
    def get_params
      polymorphicalize params, "document_id", "commentable"
      params.permit(
		:id,
		:commentable_type,
		:commentable_id,
		:text
	  )
    end


end
