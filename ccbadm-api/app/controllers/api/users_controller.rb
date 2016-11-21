class Api::UsersController < Api::ApiController
	skip_before_filter :authenticate_user!
	respond_to :json,:xml

	def index
		authorize! :show, User
		@total, @limit, @offset = header(User)
		@data = User.includes(:church).order(:first_name).limit(@limit).offset(@offset)
	end
	def show
		@object = User.find params[:id]
		authorize! :show, @object
	end
	def create
		authorize! :create, User
		@object = User.new resource_params
		if @object.save
			render :template => "api/#{controller_name}/show"
		else
			render(:json => {errors: @object.errors}, :status => 400)
		end
	end
	def update
		@object = User.find params[:id]
		authorize! :update, @object
		if @object.update resource_params
			render :template => "api/#{controller_name}/show"
		else
			render(:json => {errors: @object.errors}, :status => 400)
		end
	end
	def destroy
		@object = User.find params[:id]
		authorize! :destroy, @object
		if @object.destroy
			render(:json => {destroy: true}, :status => 200)
		else
			render(:json => {errors: @object.errors}, :status => 400)
		end

	end

	protected
	def resource_params
		params.permit(:email,:password,:group_id,:church_id,:profile_id,:first_name,:last_name)
	end

end
