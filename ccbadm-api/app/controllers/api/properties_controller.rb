require 'actionpack/action_caching'
module Api
	class PropertiesController < Api::ApiController
		skip_before_filter :authenticate_user!
		respond_to :json,:xml

		caches_action :index, :cache_path => Proc.new { |c| c.params }
		caches_action :show, :cache_path => Proc.new { |c| c.params }

		def index
			authorize! :show, Property
			if params.key?(:church_id)
				params[:church_id_eq] = params[:church_id]
				params.delete(:church_id)
			end
			@q = Property.search params
			@total, @limit, @offset = header(@q.result)
			@data = @q.result.includes(:documents,:church).limit(@limit).offset(@offset).order(is_active: :desc, title: :asc)
		end
		def show
			authorize! :show, Property
			@object = Property.find params[:id]
		end

	end
end
