require 'colorize'
module Api

	class ApiController < ActionController::Base
		before_filter :authenticate
		before_filter :set_access_control_headers

		rescue_from CanCan::AccessDenied do |exception|
			render(:json => {error: "Forbidden"}, :status => 403)
		end

		def set_access_control_headers
			headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization'
	    headers['Access-Control-Allow-Origin'] = '*'
			headers['Access-Control-Allow-Method'] = 'DELETE, GET, HEAD, OPTIONS, PATCH, POST, PUT'
			headers['Allow'] = 'DELETE, GET, HEAD, OPTIONS, PATCH, POST, PUT'
			head(:ok) if request.request_method == "OPTIONS"
		end


		def header resource
			total = resource.all.count

			limit = (params[:limit].to_i if params.key?(:limit)) || 20
			limit = 100 if limit > 100
			limit = 0 if limit < 0

			offset = (params[:offset].to_i if params.key?(:offset)) || 0
			offset = (total - 1) if offset >= total
			offset = 0 if offset < 0
			return total, limit, offset
		end
		def ransacklize params, key, polymorphic = nil
			if params[key]
				if polymorphic
					params["#{polymorphic}_id_eq"] = params[key]
					params["#{polymorphic}_type_eq"] = key.gsub("_id","").classify.to_s
				end
				params.delete(key)
			end
		end
		def polymorphicalize params, key, polymorphic
			if params[key]
				params["#{polymorphic}_id"] = params[key]
				params["#{polymorphic}_type"] = key.gsub("_id","").classify.to_s
				params.delete(key)
			end
		end
		private
		def authenticate
			if request.headers['Authorization']
				auth = request.headers['Authorization']
				@token = Rails.cache.read("token:#{auth}") || Token.includes(:user).find_by(token: auth)
				if @token
					if @token.expire_at > Time.now
						@token.touch
						@current_user = @token.user
						begin
							Rails.cache.write "token:#{auth}", @token, expires_in: 30.minutes
						rescue
							true
						end
					else
						render(:json => {error: "Token expired"}, :status => 401)
					end
				else
					render(:json => {error: "Unauthorized"}, :status => 401)
				end
			else
				render(:json => {error: "Authorization header not found"}, :status => 403)
			end
		end
		def current_user
			@current_user
			# puts @current_ability.to_s.green
		end
	end
end
