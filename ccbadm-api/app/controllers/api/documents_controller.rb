# -*- encoding : utf-8 -*-
class Api::DocumentsController < Api::ApiController
	skip_before_filter :authenticate_user!
	respond_to :json,:xml

	def index
		ransacklize params, "property_id", "documentable"
		@q = Document.search params
		# render text: @q.result.to_sql
		@total, @limit, @offset = header(@q.result)
		@data = @q.result.includes(:document_type).limit(@limit).offset(@offset).order("document_types.order")
	end
	def show
		begin
			@object = Document.find params[:id]
		rescue
			render(:json => {error: "Not found"}, :status => 404)
		end
	end
	def create
		@object = Document.new get_params
		if @object.save
			render :template => "api/#{controller_name}/show"
		else
			render(:json => {errors: @object.errors}, :status => 400)
		end
	end
	def update
		@object = Document.find params[:id]
		if @object.update get_params
			render :template => "api/#{controller_name}/show"
		else
			render(:json => {errors: @object.errors}, :status => 400)
		end
		# authorize! :update, @user
	end

	protected
    def get_params
      params.permit(
		:document_type_id,
		:expires_at,
		:is_possible,
		:is_active,
		:documentable_id,
		:documentable_type,
		:number,
		:issue_date,
		:status_id
	)
    end

end
