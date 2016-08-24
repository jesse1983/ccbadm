# -*- encoding : utf-8 -*-
class Api::AttachmentsController < Api::ApiController
	skip_before_filter :authenticate_user!
	respond_to :json,:xml


	def index
		ransacklize params, "document_id", "attachable"
		@q = Attachment.search params
		@total, @limit, @offset = header(@q.result)
		@data = @q.result.limit(@limit).offset(@offset)
	end
	def show
		begin
			@object = Attachment.find params[:id]
		rescue
			render(:json => {error: "Not found"}, :status => 404)
		end
	end
	def create
		@object = Attachment.new get_params
		if @object.save
			Attachment.where("attachable_id = ? and attachable_type = ? AND id != ?",@object.attachable_id,@object.attachable_type,@object.id).delete_all
			@object.attachable_type.constantize.reset_counters @object.attachable_id, :attachments
			render :template => "api/#{controller_name}/show"
		else
			render(:json => {errors: @object.errors}, :status => 400)
		end
		# authorize! :update, @user
	end
	def update
		@object = Attachment.find params[:id]
		if @object.update get_params
			render :template => "api/#{controller_name}/show"
		else
			render(:json => {errors: @object.errors}, :status => 400)
		end
		# authorize! :update, @user
	end
	def destroy
		@object = Attachment.find params[:id]
		if @object.destroy
			render(:json => {destroy: true}, :status => 200)
		else
			render(:json => {errors: @object.errors}, :status => 400)
		end
	end

	protected
    def get_params
      polymorphicalize params, "document_id", "attachable"
      params.permit(:attachment, :attachable_id, :attachable_type)
    end

end
