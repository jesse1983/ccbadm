# -*- encoding : utf-8 -*-
class Api::ChurchesController < Api::ApiController
	skip_before_filter :authenticate_user!
	respond_to :json,:xml


	def index
		@q = Church.search params
		@total, @limit, @offset = header(@q.result)
		@data = @q.result.order(:name).limit(@limit).offset(@offset)
	end
	def show
		begin
			@object = Church.find params[:id]
		rescue
			render(:json => {error: "Not found"}, :status => 404)
		end
	end
	def update
		@object = Church.find params[:id]
		if @object.update get_params
			render :template => "api/#{controller_name}/show"
		else
			render(:json => {errors: @object.errors}, :status => 400)
		end
		# authorize! :update, @user
	end

	protected
    def get_params
      params.permit(:name, :bras_code, :heritage_code, :group_id, :group_id, :picture)
    end

end
