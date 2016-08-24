class Api::UsersController < Api::ApiController
	include Swagger::Docs::ImpotentMethods
	skip_before_filter :authenticate_user!
	respond_to :json,:xml

	swagger_controller :users, "User Management"
	swagger_api :index do
    summary "List all users"
    notes "This lists all the active users"
    # param :query, :page, :integer, :optional, "Page number"
    # param :path, :nested_id, :integer, :optional, "Team Id"
		param :header, 'Authentication', :string, :required, 'Authentication token'
		response :ok, "Success", :User
	end


	def index
		@total, @limit, @offset = header(User)
		@data = User.includes(:church).order(:first_name).limit(@limit).offset(@offset)
		authorize! :show, User
	end
	def show
		@object = User.find params[:id]
		authorize! :show, @object
	end
	def create
		@object = User.new resource_params
		if @object.save
			render :template => "api/#{controller_name}/show"
		else
			render(:json => {errors: @object.errors}, :status => 400)
		end
		authorize! :create, @object
	end
	def update
		@object = User.find params[:id]
		if @object.update resource_params
			render :template => "api/#{controller_name}/show"
		else
			render(:json => {errors: @object.errors}, :status => 400)
		end
		authorize! :update, @object
	end
	def destroy
		@object = User.find params[:id]
		if @object.destroy
			render(:json => {destroy: true}, :status => 200)
		else
			render(:json => {errors: @object.errors}, :status => 400)
		end
		authorize! :destroy, @object

	end

	protected
	def resource_params
		params.permit(:email,:password,:group_id,:church_id,:profile_id,:first_name,:last_name)
	end

end
